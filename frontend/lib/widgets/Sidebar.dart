import 'package:flutter/material.dart';

class SidebarItem {
  final IconData icon;
  final String label;
  final String route;

  const SidebarItem({required this.icon, required this.label, required this.route});
}

class Sidebar extends StatelessWidget {
  final String activeItem;
  final void Function(String route) onNavigate;
  final VoidCallback onLogout;

  static const _bg = Color(0xFF0A2540);
  static const _gold = Color(0xFFD4AF37);
  static const _activeBg = Color(0xFF164067);

  static const _menuItems = [
    SidebarItem(icon: Icons.dashboard_outlined,      label: 'Dashboard',           route: '/admin/dashboard'),
    SidebarItem(icon: Icons.people_outline,          label: 'Mentorados',          route: '/admin/mentorados'),
    SidebarItem(icon: Icons.menu_book_outlined,      label: 'Trilhas de Conteúdo', route: '/admin/trilhas'),
    SidebarItem(icon: Icons.bar_chart_outlined,      label: 'Relatórios',          route: '/admin/relatorios'),
    SidebarItem(icon: Icons.chat_bubble_outline,     label: 'Chat de Suporte',     route: '/admin/chat'),
    SidebarItem(icon: Icons.settings_outlined,       label: 'Configurações',       route: '/admin/configuracoes'),
  ];

  const Sidebar({
    super.key,
    required this.activeItem,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      color: _bg,
      child: Column(
        children: [
          // ── Logo ──
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white12)),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        children: [
                          TextSpan(text: 'LT '),
                          TextSpan(text: 'Tax', style: TextStyle(color: _gold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Mentoria Premium',
                      style: TextStyle(fontSize: 11, color: Colors.white60),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ── Navegação ──
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                children: _menuItems.map((item) {
                  final isActive = item.label == activeItem;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: _NavButton(
                      item: item,
                      isActive: isActive,
                      onTap: () => onNavigate(item.route),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // ── Perfil do usuário ──
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.white12)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: _gold,
                      child: const Text(
                        'LT',
                        style: TextStyle(
                          color: _bg,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Laura Teixeira',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white)),
                          Text('Mentora Senior',
                              style: TextStyle(fontSize: 11, color: Colors.white60)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _LogoutButton(onTap: onLogout),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final SidebarItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({required this.item, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive ? const Color(0xFF164067) : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        hoverColor: const Color(0xFF164067).withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(item.icon, size: 18, color: isActive ? Colors.white : Colors.white70),
              const SizedBox(width: 12),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 13,
                  color: isActive ? Colors.white : Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onTap;
  const _LogoutButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        hoverColor: const Color(0xFF164067).withOpacity(0.5),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.logout, size: 16, color: Colors.white70),
              SizedBox(width: 8),
              Text('Sair', style: TextStyle(fontSize: 13, color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}