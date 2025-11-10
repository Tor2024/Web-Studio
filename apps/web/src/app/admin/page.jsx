import React, { useState, useEffect } from 'react';
import AdminList from '../../components/AdminList.jsx';
import EditorForm from '../../components/EditorForm.jsx';

export default function AdminPage() {
  const [items, setItems] = useState([]);
  const [editingItem, setEditingItem] = useState(null);
  const [type, setType] = useState('news');

  useEffect(() => {
    fetchItems();
  }, [type]);

  const fetchItems = async () => {
    const res = await fetch(`/api/${type}`);
    const data = await res.json();
    setItems(data.data || []);
  };

  const handleCreate = () => {
    setEditingItem({ type });
  };

  const handleEdit = (item) => {
    setEditingItem({ ...item, type });
  };

  const handleDelete = async (folderName) => {
    if (confirm('Удалить?')) {
      await fetch(`/api/${type}`, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ folder_name: folderName }),
      });
      fetchItems();
    }
  };

  const handleSave = async (item) => {
    const method = item.folder_name ? 'PUT' : 'POST';
    await fetch(`/api/${type}`, {
      method,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(item),
    });
    setEditingItem(null);
    fetchItems();
  };

  if (editingItem) {
    return (
      <div className="container mx-auto px-4 py-8">
        <EditorForm
          item={editingItem}
          onSave={handleSave}
          onCancel={() => setEditingItem(null)}
        />
      </div>
    );
  }

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-8">Админ панель</h1>
      <div className="mb-4">
        <button
          onClick={() => setType('news')}
          className={`px-4 py-2 mr-2 rounded ${type === 'news' ? 'bg-blue-600 text-white' : 'bg-gray-200'}`}
        >
          Новости
        </button>
        <button
          onClick={() => setType('portfolio')}
          className={`px-4 py-2 rounded ${type === 'portfolio' ? 'bg-blue-600 text-white' : 'bg-gray-200'}`}
        >
          Портфолио
        </button>
      </div>
      <AdminList
        items={items}
        onEdit={handleEdit}
        onDelete={handleDelete}
        onCreate={handleCreate}
        type={type}
      />
    </div>
  );
}
