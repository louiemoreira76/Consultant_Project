import { Edit2, Trash2, Plus } from 'lucide-react';

interface Trail {
  id: string;
  name: string;
  description: string;
  contentCount: number;
}

interface TrailListPanelProps {
  trails: Trail[];
  selectedTrailId: string | null;
  onSelectTrail: (id: string) => void;
  onAddTrail: () => void;
  onEditTrail: (id: string) => void;
  onDeleteTrail: (id: string) => void;
}

export function TrailListPanel({
  trails,
  selectedTrailId,
  onSelectTrail,
  onAddTrail,
  onEditTrail,
  onDeleteTrail,
}: TrailListPanelProps) {
  return (
    <div className="bg-white rounded-xl p-6 border border-gray-200 h-full">
      {/* Header */}
      <div className="mb-6">
        <h2 className="text-xl font-semibold text-[#0A2540] mb-4">Trilhas de Conhecimento</h2>
        <button
          onClick={onAddTrail}
          className="w-full flex items-center justify-center gap-2 px-4 py-3 rounded-lg border-2 border-[#D4AF37] text-[#D4AF37] hover:bg-[#D4AF37] hover:text-white transition-all font-medium"
        >
          <Plus className="w-5 h-5" />
          Nova Trilha
        </button>
      </div>

      {/* Trail List */}
      <div className="space-y-2">
        {trails.map((trail) => {
          const isSelected = trail.id === selectedTrailId;

          return (
            <div
              key={trail.id}
              className={`
                group relative p-4 rounded-lg border-2 cursor-pointer transition-all
                ${isSelected
                  ? 'border-[#0A2540] bg-[#0A2540]/5'
                  : 'border-gray-200 hover:border-[#0A2540]/30 hover:bg-gray-50'
                }
              `}
              onClick={() => onSelectTrail(trail.id)}
            >
              <h3 className={`font-semibold mb-1 ${isSelected ? 'text-[#0A2540]' : 'text-gray-800'}`}>
                {trail.name}
              </h3>
              <p className="text-sm text-gray-500 mb-2 line-clamp-2">{trail.description}</p>
              <div className="flex items-center justify-between">
                <span className="text-xs text-gray-500">
                  {trail.contentCount} {trail.contentCount === 1 ? 'conteúdo' : 'conteúdos'}
                </span>

                {/* Action Buttons */}
                <div className="flex gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      onEditTrail(trail.id);
                    }}
                    className="p-1.5 rounded hover:bg-white text-gray-600 hover:text-[#0A2540] transition-colors"
                    title="Editar"
                  >
                    <Edit2 className="w-3.5 h-3.5" />
                  </button>
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      onDeleteTrail(trail.id);
                    }}
                    className="p-1.5 rounded hover:bg-white text-gray-600 hover:text-red-600 transition-colors"
                    title="Excluir"
                  >
                    <Trash2 className="w-3.5 h-3.5" />
                  </button>
                </div>
              </div>
            </div>
          );
        })}
      </div>

      {trails.length === 0 && (
        <div className="text-center py-12">
          <p className="text-gray-400 text-sm">Nenhuma trilha criada ainda</p>
        </div>
      )}
    </div>
  );
}
