import { FileText, Video, Settings } from 'lucide-react';

interface Trail {
  id: number;
  title: string;
  videoCount: number;
  pdfCount: number;
  color: string;
}

const mockTrails: Trail[] = [
  {
    id: 1,
    title: 'Recuperação de Créditos',
    videoCount: 12,
    pdfCount: 8,
    color: '#0A2540',
  },
  {
    id: 2,
    title: 'Planejamento Tributário',
    videoCount: 15,
    pdfCount: 10,
    color: '#5A6C7D',
  },
  {
    id: 3,
    title: 'Compliance Fiscal',
    videoCount: 10,
    pdfCount: 6,
    color: '#3B82F6',
  },
  {
    id: 4,
    title: 'ICMS na Prática',
    videoCount: 8,
    pdfCount: 5,
    color: '#10B981',
  },
];

export function TrailCards() {
  return (
    <div className="bg-white rounded-xl shadow-sm border border-gray-100">
      <div className="px-6 py-4 border-b border-gray-100">
        <h2 className="text-lg font-semibold text-[#0A2540]">
          Trilhas Ativas
        </h2>
      </div>

      <div className="p-4 space-y-3">
        {mockTrails.map((trail) => (
          <div
            key={trail.id}
            className="border border-gray-200 rounded-lg p-4 hover:border-[#0A2540] transition-all group"
          >
            <div className="flex items-start justify-between mb-3">
              <h3 className="font-medium text-gray-900 flex-1">
                {trail.title}
              </h3>
              <div 
                className="w-3 h-3 rounded-full"
                style={{ backgroundColor: trail.color }}
              />
            </div>

            <div className="flex items-center gap-4 text-sm text-gray-600 mb-4">
              <div className="flex items-center gap-1.5">
                <Video className="w-4 h-4" />
                <span>{trail.videoCount} vídeos</span>
              </div>
              <div className="flex items-center gap-1.5">
                <FileText className="w-4 h-4" />
                <span>{trail.pdfCount} PDFs</span>
              </div>
            </div>

            <button className="w-full flex items-center justify-center gap-2 px-4 py-2 bg-gray-50 hover:bg-[#D4AF37] text-gray-700 hover:text-[#0A2540] rounded-lg transition-all font-medium group-hover:bg-[#D4AF37]">
              <Settings className="w-4 h-4" />
              <span>Gerenciar Conteúdo</span>
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}
