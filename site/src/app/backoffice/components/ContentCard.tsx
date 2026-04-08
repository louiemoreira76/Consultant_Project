import { Play, FileText, Edit2, Trash2, Upload } from 'lucide-react';

interface ContentCardProps {
  type: 'video' | 'pdf';
  title: string;
  uploadDate: string;
  engagementData: number[];
  views: number;
  dropoffPoint: string;
  onEdit: () => void;
  onReplace: () => void;
  onDelete: () => void;
}

export function ContentCard({
  type,
  title,
  uploadDate,
  engagementData,
  views,
  dropoffPoint,
  onEdit,
  onReplace,
  onDelete,
}: ContentCardProps) {
  const maxValue = Math.max(...engagementData);

  return (
    <div className="bg-white rounded-xl p-5 border border-gray-200 hover:border-[#0A2540]/20 transition-all group">
      <div className="flex items-start gap-4">
        {/* Icon */}
        <div className={`w-12 h-12 rounded-lg flex items-center justify-center ${
          type === 'video' ? 'bg-blue-50 text-blue-600' : 'bg-amber-50 text-amber-600'
        }`}>
          {type === 'video' ? <Play className="w-6 h-6" /> : <FileText className="w-6 h-6" />}
        </div>

        {/* Content Info */}
        <div className="flex-1 min-w-0">
          <h3 className="font-semibold text-[#0A2540] mb-1">{title}</h3>
          <p className="text-sm text-gray-500 mb-3">Upload: {uploadDate}</p>

          {/* Engagement Stats */}
          <div className="flex items-center gap-6 mb-3">
            <div>
              <p className="text-xs text-gray-500">Visualizações</p>
              <p className="text-sm font-semibold text-[#0A2540]">{views}</p>
            </div>
            <div>
              <p className="text-xs text-gray-500">Ponto de Abandono</p>
              <p className="text-sm font-semibold text-orange-600">{dropoffPoint}</p>
            </div>
          </div>

          {/* Sparkline Chart */}
          <div className="flex items-end gap-0.5 h-8">
            {engagementData.map((value, index) => (
              <div
                key={index}
                className="flex-1 bg-[#0A2540]/80 rounded-t transition-all hover:bg-[#D4AF37]"
                style={{ height: `${(value / maxValue) * 100}%` }}
              />
            ))}
          </div>
        </div>

        {/* Action Buttons */}
        <div className="flex gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
          <button
            onClick={onEdit}
            className="p-2 rounded-lg hover:bg-gray-100 text-gray-600 hover:text-[#0A2540] transition-colors"
            title="Editar Informações"
          >
            <Edit2 className="w-4 h-4" />
          </button>
          <button
            onClick={onReplace}
            className="p-2 rounded-lg hover:bg-gray-100 text-gray-600 hover:text-blue-600 transition-colors"
            title="Substituir Arquivo"
          >
            <Upload className="w-4 h-4" />
          </button>
          <button
            onClick={onDelete}
            className="p-2 rounded-lg hover:bg-red-50 text-gray-600 hover:text-red-600 transition-colors"
            title="Remover"
          >
            <Trash2 className="w-4 h-4" />
          </button>
        </div>
      </div>
    </div>
  );
}
