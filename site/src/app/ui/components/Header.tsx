import { Search, Bell, Plus } from 'lucide-react';

export function Header() {
  return (
    <header className="bg-white border-b border-gray-200 px-8 py-4">
      <div className="flex items-center justify-between">
        {/* Title */}
        <div>
          <h1 className="text-2xl font-semibold text-[#0A2540]">
            Gestão Estratégica de Mentorados
          </h1>
        </div>

        {/* Actions */}
        <div className="flex items-center gap-4">
          {/* Search Bar */}
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
            <input
              type="text"
              placeholder="Buscar..."
              className="pl-10 pr-4 py-2 w-80 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-[#0A2540] focus:border-transparent bg-gray-50"
            />
          </div>

          {/* Notification Bell */}
          <button className="relative p-2 rounded-lg hover:bg-gray-100 transition-colors">
            <Bell className="w-5 h-5 text-gray-600" />
            <span className="absolute top-1 right-1 w-2 h-2 bg-red-500 rounded-full"></span>
          </button>

          {/* Primary Action Button */}
          <button className="flex items-center gap-2 px-5 py-2.5 bg-[#D4AF37] text-[#0A2540] rounded-lg hover:bg-[#C19D2F] transition-all font-medium shadow-sm">
            <Plus className="w-5 h-5" />
            <span>Novo Conteúdo</span>
          </button>
        </div>
      </div>
    </header>
  );
}
