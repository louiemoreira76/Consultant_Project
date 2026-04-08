import {
  Home,
  BookOpen,
  Play,
  Trophy,
  MessageCircle,
  User,
  LogOut
} from 'lucide-react';
import { useNavigate, useLocation } from 'react-router-dom';

interface StudentSidebarProps {
  activeItem?: string;
}

export function StudentSidebar({ activeItem }: StudentSidebarProps) {
  const navigate = useNavigate();
  const location = useLocation();

  const menuItems = [
    { icon: Home, label: 'Início', path: '/app/home' },
    { icon: BookOpen, label: 'Minhas Trilhas', path: '/app/trilhas' },
    { icon: Play, label: 'Continuar Assistindo', path: '/app/assistindo' },
    { icon: Trophy, label: 'Meu Progresso', path: '/app/progresso' },
    { icon: MessageCircle, label: 'Dúvidas', path: '/app/duvidas' },
    { icon: User, label: 'Meu Perfil', path: '/app/perfil' },
  ];

  return (
    <aside className="w-64 bg-white border-r border-gray-200 flex flex-col fixed left-0 top-0 h-screen">
      {/* Logo */}
      <div className="p-6 border-b border-gray-200">
        <h1 className="text-2xl font-bold tracking-tight text-[#0A2540]">
          LT <span className="text-[#D4AF37]">Tax</span>
        </h1>
        <p className="text-xs text-gray-500 mt-1">Portal do Aluno</p>
      </div>

      {/* Navigation */}
      <nav className="flex-1 px-3 py-6 space-y-1">
        {menuItems.map((item) => {
          const Icon = item.icon;
          const isActive = activeItem ? item.label === activeItem : location.pathname === item.path;

          return (
            <button
              key={item.label}
              onClick={() => navigate(item.path)}
              className={`
                w-full flex items-center gap-3 px-4 py-3 rounded-lg transition-all
                ${isActive
                  ? 'bg-[#0A2540] text-white'
                  : 'text-gray-700 hover:bg-gray-100'
                }
              `}
            >
              <Icon className="w-5 h-5" />
              <span className="text-sm">{item.label}</span>
            </button>
          );
        })}
      </nav>

      {/* User Profile */}
      <div className="p-4 border-t border-gray-200">
        <div className="flex items-center gap-3 mb-3">
          <div className="w-10 h-10 rounded-full bg-gradient-to-br from-blue-500 to-blue-600 flex items-center justify-center">
            <span className="text-white font-semibold text-sm">IT</span>
          </div>
          <div className="flex-1">
            <p className="text-sm font-medium text-gray-900">Italo Silva</p>
            <p className="text-xs text-gray-500">Aluno Premium</p>
          </div>
        </div>
        <button className="w-full flex items-center gap-2 px-4 py-2 rounded-lg text-sm text-gray-600 hover:bg-gray-100 transition-all">
          <LogOut className="w-4 h-4" />
          <span>Sair</span>
        </button>
      </div>
    </aside>
  );
}
