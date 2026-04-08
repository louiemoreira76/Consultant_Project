import { Plus, Search, Video, FileText } from 'lucide-react';
import { ContentCard } from './ContentCard';
import { useState } from 'react';

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

interface Trail {
  id: string;
  name: string;
  description: string;
  contentCount: number;
}

interface ContentPanelProps {
  trail: Trail | null;
  contents: Content[];
  onAddVideo: () => void;
  onAddPDF: () => void;
  onEditContent: (id: string) => void;
  onReplaceContent: (id: string) => void;
  onDeleteContent: (id: string) => void;
}

export function ContentPanel({
  trail,
  contents,
  onAddVideo,
  onAddPDF,
  onEditContent,
  onReplaceContent,
  onDeleteContent,
}: ContentPanelProps) {
  const [searchQuery, setSearchQuery] = useState('');

  if (!trail) {
    return (
      <div className="bg-white rounded-xl p-12 border border-gray-200 h-full flex items-center justify-center">
        <div className="text-center">
          <div className="w-16 h-16 rounded-full bg-gray-100 mx-auto mb-4 flex items-center justify-center">
            <FileText className="w-8 h-8 text-gray-400" />
          </div>
          <p className="text-gray-500">Selecione uma trilha para gerenciar o conteúdo</p>
        </div>
      </div>
    );
  }

  const filteredContents = contents.filter(content =>
    content.title.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const videoCount = contents.filter(c => c.type === 'video').length;
  const pdfCount = contents.filter(c => c.type === 'pdf').length;

  return (
    <div className="bg-white rounded-xl p-6 border border-gray-200 h-full flex flex-col">
      {/* Header */}
      <div className="mb-6">
        <div className="flex items-start justify-between mb-4">
          <div className="flex-1">
            <h2 className="text-2xl font-bold text-[#0A2540] mb-2">{trail.name}</h2>
            <p className="text-gray-600">{trail.description}</p>
          </div>
          <div className="flex gap-2">
            <div className="px-3 py-1.5 rounded-lg bg-blue-50 text-blue-700 text-sm font-medium flex items-center gap-1.5">
              <Video className="w-4 h-4" />
              {videoCount} {videoCount === 1 ? 'vídeo' : 'vídeos'}
            </div>
            <div className="px-3 py-1.5 rounded-lg bg-amber-50 text-amber-700 text-sm font-medium flex items-center gap-1.5">
              <FileText className="w-4 h-4" />
              {pdfCount} {pdfCount === 1 ? 'PDF' : 'PDFs'}
            </div>
          </div>
        </div>

        {/* Action Bar */}
        <div className="flex items-center gap-3">
          <button
            onClick={onAddVideo}
            className="flex items-center gap-2 px-4 py-2.5 rounded-lg bg-[#D4AF37] text-white hover:bg-[#C49F2F] transition-all font-medium"
          >
            <Plus className="w-4 h-4" />
            Adicionar Vídeo
          </button>
          <button
            onClick={onAddPDF}
            className="flex items-center gap-2 px-4 py-2.5 rounded-lg border-2 border-[#D4AF37] text-[#D4AF37] hover:bg-[#D4AF37] hover:text-white transition-all font-medium"
          >
            <Plus className="w-4 h-4" />
            Adicionar PDF
          </button>

          {/* Search */}
          <div className="flex-1 ml-auto max-w-xs">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-gray-400" />
              <input
                type="text"
                placeholder="Buscar conteúdo..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540]"
              />
            </div>
          </div>
        </div>
      </div>

      {/* Content List */}
      <div className="flex-1 overflow-y-auto space-y-3">
        {filteredContents.length > 0 ? (
          filteredContents.map((content) => (
            <ContentCard
              key={content.id}
              type={content.type}
              title={content.title}
              uploadDate={content.uploadDate}
              engagementData={content.engagementData}
              views={content.views}
              dropoffPoint={content.dropoffPoint}
              onEdit={() => onEditContent(content.id)}
              onReplace={() => onReplaceContent(content.id)}
              onDelete={() => onDeleteContent(content.id)}
            />
          ))
        ) : (
          <div className="text-center py-12">
            <p className="text-gray-400">
              {searchQuery ? 'Nenhum conteúdo encontrado' : 'Nenhum conteúdo adicionado ainda'}
            </p>
          </div>
        )}
      </div>
    </div>
  );
}
