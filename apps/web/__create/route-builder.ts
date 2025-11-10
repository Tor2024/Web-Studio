import { join } from 'path';
import { fileURLToPath } from 'url';
import { Hono } from 'hono';
import type { Handler } from 'hono/types';
import updatedFetch from '../src/__create/fetch';

const API_BASENAME = '/api';
const api = new Hono();

const routeBuilderDir = join(fileURLToPath(new URL('.', import.meta.url)));
const routeModules = (import.meta as any).glob('../src/app/api/**/route.{js,ts}');
if (globalThis.fetch) {
  globalThis.fetch = updatedFetch;
}

// Helper function to transform file path to Hono route path
function getHonoPath(relativePath: string): { name: string; pattern: string }[] {
  const parts = relativePath.split('/').filter(Boolean);
  const routeParts = parts.slice(0, -1); // Remove 'route.js'
  if (routeParts.length === 0) {
    return [{ name: 'root', pattern: '' }];
  }
  const transformedParts = routeParts.map((segment) => {
    const match = segment.match(/^\[(\.{3})?([^\]]+)\]$/);
    if (match) {
      const [_, dots, param] = match;
      return dots === '...'
        ? { name: param, pattern: `:${param}{.+}` }
        : { name: param, pattern: `:${param}` };
    }
    return { name: segment, pattern: segment };
  });
  return transformedParts;
}

// Import and register all routes
async function registerRoutes() {
  const routeKeys = Object.keys(routeModules).sort((a, b) => b.length - a.length);

  // Clear existing routes
  api.routes = [];

  for (const key of routeKeys) {
    try {
      const route = await routeModules[key]();

      const methods = ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'];
      for (const method of methods) {
        try {
          const routeModule = route.default || route;
          if (routeModule[method]) {
            const parts = getHonoPath(key);
            const honoPath = `/${parts.map(({ pattern }) => pattern).join('/')}`;
            const handler: Handler = async (c) => {
              const params = c.req.param();
              // @ts-ignore
              if (import.meta.env.DEV) {
                const updatedRoute = await routeModules[key]();
                const updatedModule = updatedRoute.default || updatedRoute;
                return await updatedModule[method](c.req.raw, { params });
              }
              return await routeModule[method](c.req.raw, { params });
            };
            const methodLowercase = method.toLowerCase();
            switch (methodLowercase) {
              case 'get':
                api.get(honoPath, handler);
                break;
              case 'post':
                api.post(honoPath, handler);
                break;
              case 'put':
                api.put(honoPath, handler);
                break;
              case 'delete':
                api.delete(honoPath, handler);
                break;
              case 'patch':
                api.patch(honoPath, handler);
                break;
              default:
                console.warn(`Unsupported method: ${method}`);
                break;
            }
          }
        } catch (error) {
          console.error(`Error registering route ${key} for method ${method}:`, error);
        }
      }
    } catch (error) {
      console.error(`Error importing route file ${key}:`, error);
    }
  }
}

// Initial route registration
await registerRoutes();

// Hot reload routes in development
// @ts-ignore
if (import.meta.env.DEV) {
  // @ts-ignore
  import.meta.glob('../src/app/api/**/route.{js,ts}', {
    eager: true,
  });
  // @ts-ignore
  if (import.meta.hot) {
    // @ts-ignore
    import.meta.hot.accept((newSelf) => {
      registerRoutes().catch((err) => {
        console.error('Error reloading routes:', err);
      });
    });
  }
}

export { api, API_BASENAME };
