1:"$Sreact.fragment"
2:I[4731,["106","static/chunks/106-3555543c242532fe.js","177","static/chunks/app/layout-5822585c143010fc.js"],"default"]
3:I[9766,[],""]
4:I[8924,[],""]
9:I[7150,[],""]
5:T642,
            .font-kalam { font-family: 'Kalam', cursive; }
            .font-caveat { font-family: 'Caveat', cursive; }

            /* Анимации рисования с цветными контурами */
            @keyframes draw {
              from { stroke-dashoffset: 100%; }
              to { stroke-dashoffset: 0%; }
            }

            @keyframes colorful-appear {
              from {
                opacity: 0;
                transform: scale(0.98);
              }
              to {
                opacity: 1;
                transform: scale(1.04);
              }
            }

            .hand-drawn-animation {
              stroke-dasharray: 100%;
              animation: draw 0.8s ease-out forwards;
            }

            .watercolor-hover {
              transition: all 0.5s cubic-bezier(0.23, 1, 0.32, 1);
            }

            .watercolor-hover:hover {
              animation: colorful-appear 0.6s ease-out;
              transform: scale(1.06);
            }

            /* Цветной скроллбар */
            ::-webkit-scrollbar {
              width: 8px;
            }

            ::-webkit-scrollbar-track {
              background: transparent;
            }

            ::-webkit-scrollbar-thumb {
              background: linear-gradient(135deg, #A8D5BA, #F0C5A9, #D4C5F9);
              border-radius: 10px;
              border: 2px solid transparent;
            }

            ::-webkit-scrollbar-thumb:hover {
              background: linear-gradient(135deg, #8BC4A0, #E8B599, #C4B5E9);
            }
          0:{"P":null,"b":"iAi3wArmOT_xmeOTgDAT9","p":"","c":["","about"],"i":false,"f":[[["",{"children":["about",{"children":["__PAGE__",{}]}]},"$undefined","$undefined",true],["",["$","$1","c",{"children":[null,["$","html",null,{"lang":"en","children":[["$","head",null,{"children":[["$","meta",null,{"charSet":"utf-8"}],["$","meta",null,{"name":"viewport","content":"width=device-width, initial-scale=1"}],["$","title",null,{"children":"Oleh Kalchenko - Web Studio"}]]}],["$","body",null,{"children":["$","div",null,{"className":"min-h-screen bg-[#FEFEFE] text-[#2A2A2A] font-kalam","children":[["$","div",null,{"className":"fixed inset-0 pointer-events-none opacity-5 z-0","style":{"backgroundImage":"url(\"data:image/svg+xml,%3Csvg viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23666666' fill-opacity='0.03'%3E%3Cpath d='m40 40c0-4.4-3.6-8-8-8s-8 3.6-8 8 3.6 8 8 8 8-3.6 8-8zm0-32c0-4.4-3.6-8-8-8s-8 3.6-8 8 3.6 8 8 8 8-3.6 8-8zm-32 0c0-4.4-3.6-8-8-8s-8 3.6-8 8 3.6 8 8 8 8-3.6 8-8z'/%3E%3C/svg%3E\")","backgroundSize":"40px 40px"}}],["$","div",null,{"className":"relative z-10","children":["$","$L2",null,{"children":["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]],"forbidden":"$undefined","unauthorized":"$undefined"}]}]}],["$","style",null,{"children":"$5"}]]}]}]]}]]}],{"children":["about","$L6",{"children":["__PAGE__","$L7",{},null,false]},null,false]},null,false],"$L8",false]],"m":"$undefined","G":["$9",[]],"s":false,"S":true}
a:I[1959,[],"ClientPageRoot"]
b:I[2118,["739","static/chunks/739-d3c9d6439790e4c0.js","220","static/chunks/app/about/page-6a7d0c6d5ec86c33.js"],"default"]
e:I[4431,[],"OutletBoundary"]
10:I[5278,[],"AsyncMetadataOutlet"]
12:I[4431,[],"ViewportBoundary"]
14:I[4431,[],"MetadataBoundary"]
15:"$Sreact.suspense"
6:["$","$1","c",{"children":[null,["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":"$undefined","forbidden":"$undefined","unauthorized":"$undefined"}]]}]
7:["$","$1","c",{"children":[["$","$La",null,{"Component":"$b","searchParams":{},"params":{},"promises":["$@c","$@d"]}],null,["$","$Le",null,{"children":["$Lf",["$","$L10",null,{"promise":"$@11"}]]}]]}]
8:["$","$1","h",{"children":[null,[["$","$L12",null,{"children":"$L13"}],null],["$","$L14",null,{"children":["$","div",null,{"hidden":true,"children":["$","$15",null,{"fallback":null,"children":"$L16"}]}]}]]}]
c:{}
d:"$7:props:children:0:props:params"
13:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
f:null
11:{"metadata":[],"error":null,"digest":"$undefined"}
16:"$11:metadata"
