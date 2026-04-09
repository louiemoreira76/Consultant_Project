import { Bell, Search, Menu, User, TrendingUp, MessageSquare, LogOut } from 'lucide-react';
import { useState, useRef, useEffect } from 'react';
import { useNavigate } from 'react-router';

export function StudentHeader() {
  const [searchQuery, setSearchQuery] = useState('');
  const [menuOpen, setMenuOpen] = useState(false);
  const [notificationsOpen, setNotificationsOpen] = useState(false);
  const menuRef = useRef<HTMLDivElement>(null);
  const notificationsRef = useRef<HTMLDivElement>(null);
  const navigate = useNavigate();

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (menuRef.current && !menuRef.current.contains(event.target as Node)) {
        setMenuOpen(false);
      }
      if (notificationsRef.current && !notificationsRef.current.contains(event.target as Node)) {
        setNotificationsOpen(false);
      }
    }

    if (menuOpen || notificationsOpen) {
      document.addEventListener('mousedown', handleClickOutside);
    }
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, [menuOpen, notificationsOpen]);

  const handleMenuClick = (path: string) => {
    setMenuOpen(false);
    if (path === '/logout') {
      navigate('/');
    } else {
      navigate(path);
    }
  };

  return (
    <header className="bg-white border-b border-gray-200 px-8 py-4 sticky top-0 z-20">
      <div className="flex items-center justify-between gap-6 max-w-7xl mx-auto">
        {/* Logo - Right Side */}
        <div className="flex-shrink-0">
          <div className="flex items-center gap-2">
            <div className="w-10 h-10 bg-gradient-to-br from-[#0A2540] to-[#1a3a5f] rounded-lg flex items-center justify-center">
              <span className="text-white font-bold text-lg">L</span>
            </div>
            <span className="font-bold text-[#0A2540] text-lg hidden md:block">LearnHub</span>
          </div>
        </div>

        {/* Search Bar - Center */}
        <div className="flex-1 max-w-2xl">
          <div className="relative">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-5 h-5 text-gray-400" />
            <input
              type="text"
              placeholder="Buscar aulas, trilhas ou materiais..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-11 pr-4 py-2.5 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540] bg-gray-50"
            />
          </div>
        </div>

        {/* Right Side Actions */}
        <div className="flex items-center gap-3">
          {/* Hamburger Menu */}
          <div className="relative" ref={menuRef}>
            <button
              onClick={() => setMenuOpen(!menuOpen)}
              className="p-2 rounded-lg hover:bg-gray-100 transition-colors"
            >
              <Menu className="w-5 h-5 text-gray-600" />
            </button>

            {/* Dropdown Menu */}
            {menuOpen && (
              <div className="absolute right-0 mt-2 w-56 bg-white rounded-lg shadow-lg border border-gray-200 py-2 z-30">
                <button
                  onClick={() => handleMenuClick('/app/perfil')}
                  className="w-full px-4 py-2.5 text-left hover:bg-gray-50 flex items-center gap-3 text-gray-700 transition-colors"
                >
                  <User className="w-4 h-4" />
                  <span>Meu Perfil</span>
                </button>
                <button
                  onClick={() => handleMenuClick('/app/progresso')}
                  className="w-full px-4 py-2.5 text-left hover:bg-gray-50 flex items-center gap-3 text-gray-700 transition-colors"
                >
                  <TrendingUp className="w-4 h-4" />
                  <span>Meu Progresso</span>
                </button>
                <button
                  onClick={() => handleMenuClick('/app/duvidas')}
                  className="w-full px-4 py-2.5 text-left hover:bg-gray-50 flex items-center gap-3 text-gray-700 transition-colors"
                >
                  <MessageSquare className="w-4 h-4" />
                  <span>Dúvidas</span>
                </button>
                <div className="border-t border-gray-200 my-2"></div>
                <button
                  onClick={() => handleMenuClick('/logout')}
                  className="w-full px-4 py-2.5 text-left hover:bg-gray-50 flex items-center gap-3 text-red-600 transition-colors"
                >
                  <LogOut className="w-4 h-4" />
                  <span>Sair</span>
                </button>
              </div>
            )}
          </div>

          {/* Notification Bell */}
          <div className="relative" ref={notificationsRef}>
            <button
              onClick={() => setNotificationsOpen(!notificationsOpen)}
              className="relative p-2 rounded-lg hover:bg-gray-100 transition-colors"
            >
              <Bell className="w-5 h-5 text-gray-600" />
              <span className="absolute top-1 right-1 w-2 h-2 bg-red-500 rounded-full"></span>
            </button>

            {/* Notifications Dropdown */}
            {notificationsOpen && (
              <div className="absolute right-0 mt-2 w-80 bg-white rounded-lg shadow-lg border border-gray-200 py-2 z-30">
                <div className="px-4 py-3 border-b border-gray-200">
                  <h3 className="font-semibold text-gray-900">Notificações</h3>
                </div>
                <div className="max-h-96 overflow-y-auto">
                  <button className="w-full px-4 py-3 text-left hover:bg-gray-50 transition-colors border-b border-gray-100">
                    <p className="text-sm font-medium text-gray-900 mb-1">
                      Laura Teixeira respondeu sua mensagem
                    </p>
                    <p className="text-xs text-gray-500">Há 2 horas</p>
                  </button>
                  <button className="w-full px-4 py-3 text-left hover:bg-gray-50 transition-colors">
                    <p className="text-sm font-medium text-gray-900 mb-1">
                      Recuperação de Créditos Tributários foi concluído
                    </p>
                    <p className="text-xs text-gray-500">Há 1 dia</p>
                  </button>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </header>
  );
}
