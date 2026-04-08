import { X } from 'lucide-react';
import { useState, useEffect } from 'react';

interface Trail {
  id: string;
  name: string;
  description: string;
  contentCount: number;
}

interface AddTrailModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSave: (trail: Omit<Trail, 'id' | 'contentCount'>) => void;
  editingTrail?: Trail | null;
}

export function AddTrailModal({ isOpen, onClose, onSave, editingTrail }: AddTrailModalProps) {
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');

  useEffect(() => {
    if (editingTrail) {
      setName(editingTrail.name);
      setDescription(editingTrail.description);
    } else {
      setName('');
      setDescription('');
    }
  }, [editingTrail, isOpen]);

  if (!isOpen) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (name.trim() && description.trim()) {
      onSave({ name, description });
      setName('');
      setDescription('');
      onClose();
    }
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
      <div className="bg-white rounded-xl p-6 w-full max-w-md">
        {/* Header */}
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-semibold text-[#0A2540]">
            {editingTrail ? 'Editar Trilha' : 'Nova Trilha'}
          </h2>
          <button
            onClick={onClose}
            className="p-1 rounded-lg hover:bg-gray-100 text-gray-500 hover:text-gray-700"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Form */}
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Nome da Trilha *
            </label>
            <input
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder="Ex: Recuperação de Créditos Tributários"
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540]"
              required
            />
          </div>

          <div className="mb-6">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Descrição *
            </label>
            <textarea
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              placeholder="Descreva o objetivo e conteúdo desta trilha..."
              rows={4}
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540] resize-none"
              required
            />
          </div>

          {/* Actions */}
          <div className="flex gap-3">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 px-4 py-2.5 rounded-lg border border-gray-300 text-gray-700 hover:bg-gray-50 transition-all font-medium"
            >
              Cancelar
            </button>
            <button
              type="submit"
              className="flex-1 px-4 py-2.5 rounded-lg bg-[#D4AF37] text-white hover:bg-[#C49F2F] transition-all font-medium"
            >
              {editingTrail ? 'Salvar Alterações' : 'Criar Trilha'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
