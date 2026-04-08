import { X, Upload } from 'lucide-react';
import { useState, useEffect } from 'react';

interface Content {
  id: string;
  type: 'video' | 'pdf';
  title: string;
  description: string;
  uploadDate: string;
  engagementData: number[];
  views: number;
  dropoffPoint: string;
}

interface AddContentModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSave: (content: Omit<Content, 'id' | 'uploadDate' | 'engagementData' | 'views' | 'dropoffPoint'>) => void;
  contentType: 'video' | 'pdf';
  editingContent?: Content | null;
}

export function AddContentModal({
  isOpen,
  onClose,
  onSave,
  contentType,
  editingContent
}: AddContentModalProps) {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [fileName, setFileName] = useState('');

  useEffect(() => {
    if (editingContent) {
      setTitle(editingContent.title);
      setDescription(editingContent.description);
    } else {
      setTitle('');
      setDescription('');
      setFileName('');
    }
  }, [editingContent, isOpen]);

  if (!isOpen) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (title.trim() && description.trim()) {
      onSave({
        type: contentType,
        title,
        description
      });
      setTitle('');
      setDescription('');
      setFileName('');
      onClose();
    }
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      setFileName(file.name);
    }
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
      <div className="bg-white rounded-xl p-6 w-full max-w-md">
        {/* Header */}
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-semibold text-[#0A2540]">
            {editingContent
              ? `Editar ${contentType === 'video' ? 'Vídeo' : 'PDF'}`
              : `Adicionar ${contentType === 'video' ? 'Vídeo' : 'PDF'}`}
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
              Título *
            </label>
            <input
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              placeholder={`Ex: ${contentType === 'video' ? 'Aula 01 - Introdução ao PIS/COFINS' : 'Checklist de Documentos'}`}
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540]"
              required
            />
          </div>

          <div className="mb-4">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Descrição *
            </label>
            <textarea
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              placeholder="Descreva o conteúdo e objetivos..."
              rows={3}
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540] resize-none"
              required
            />
          </div>

          {!editingContent && (
            <div className="mb-6">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Arquivo {contentType === 'video' ? '(MP4, AVI, MOV)' : '(PDF)'} *
              </label>
              <div className="relative">
                <input
                  type="file"
                  onChange={handleFileChange}
                  accept={contentType === 'video' ? 'video/*' : '.pdf'}
                  className="hidden"
                  id="file-upload"
                  required={!editingContent}
                />
                <label
                  htmlFor="file-upload"
                  className="flex items-center gap-2 px-4 py-3 border-2 border-dashed border-gray-300 rounded-lg cursor-pointer hover:border-[#0A2540] hover:bg-gray-50 transition-all"
                >
                  <Upload className="w-5 h-5 text-gray-400" />
                  <span className="text-sm text-gray-600">
                    {fileName || 'Clique para selecionar arquivo'}
                  </span>
                </label>
              </div>
            </div>
          )}

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
              {editingContent ? 'Salvar Alterações' : 'Adicionar'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
