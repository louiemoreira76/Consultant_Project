import {
  LayoutDashboard,
  Users,
  BookOpen,
  BarChart3,
  MessageSquare,
  Settings,
  LogOut
} from 'lucide-react';
import { useNavigate, useLocation } from 'react-router';

interface SidebarProps {
  activeItem?: string;
}

export function Sidebar({ activeItem }: SidebarProps) {
  const navigate = useNavigate();
  const location = useLocation();

  const menuItems = [
    { icon: LayoutDashboard, label: 'Dashboard', path: '/admin/dashboard' },
    { icon: Users, label: 'Mentorados', path: '/admin/mentorados' },
    { icon: BookOpen, label: 'Trilhas de Conteúdo', path: '/admin/trilhas' },
    { icon: BarChart3, label: 'Relatórios', path: '/admin/relatorios' },
    { icon: MessageSquare, label: 'Chat de Suporte', path: '/admin/chat' },
    { icon: Settings, label: 'Configurações', path: '/admin/configuracoes' },
  ];

  return (
    <aside className="w-64 bg-[#0A2540] text-white flex flex-col fixed left-0 top-0 h-screen">
      {/* Logo */}
      <div className="p-6 border-b border-white/10">
        <h1 className="text-2xl font-bold tracking-tight">
          LT <span className="text-[#D4AF37]">Tax</span>
        </h1>
        <p className="text-xs text-white/60 mt-1">Mentoria Premium</p>
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
                  ? 'bg-[#164067] text-white'
                  : 'text-white/70 hover:bg-[#164067]/50 hover:text-white'
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
      <div className="p-4 border-t border-white/10">
        <div className="flex items-center gap-3 mb-3">
          <div className="w-10 h-10 rounded-full bg-[#D4AF37] flex items-center justify-center">
            <span className="text-[#0A2540] font-semibold">LT</span>
          </div>
          <div className="flex-1">
            <p className="text-sm font-medium">Laura Teixeira</p>
            <p className="text-xs text-white/60">Mentora Senior</p>
          </div>
        </div>
        <button className="w-full flex items-center gap-2 px-4 py-2 rounded-lg text-sm text-white/70 hover:bg-[#164067]/50 hover:text-white transition-all">
          <LogOut className="w-4 h-4" />
          <span>Sair</span>
        </button>
      </div>
    </aside>
  );
}
