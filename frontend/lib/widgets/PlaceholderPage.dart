import 'package:flutter/material.dart';
import '../widgets/Sidebar.dart';
import '../widgets/Header.dart';

class PlaceholderPage extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String activeSidebarItem;

  const PlaceholderPage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.activeSidebarItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: Row(
        children: [
          // Sidebar
          SizedBox(
            width: 256,
            child: Sidebar(
              activeItem: activeSidebarItem,
              onNavigate: (route) {
                debugPrint('Navegar para: $route');
                Navigator.pushReplacementNamed(context, route);
              },
              onLogout: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ),
          // Conteúdo principal
          Expanded(
            child: Column(
              children: [
                const Header(),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(32),
                      padding: const EdgeInsets.all(48),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icon,
                            size: 64,
                            color: const Color(0xFF0A2540),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0A2540),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}