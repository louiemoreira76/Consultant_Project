// lib/screens/mentorados.dart
import 'package:flutter/material.dart';
import '../widgets/Header.dart';
import '../widgets/Sidebar.dart';

class MentoradosPage extends StatelessWidget {
  const MentoradosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: Row(
        children: [
          // Sidebar com largura fixa (256px = w-64)
          SizedBox(
            width: 256,
            child: Sidebar(
              activeItem: 'Mentorados',
onNavigate: (route) {
  debugPrint('Navegar para: $route');
  Navigator.pushReplacementNamed(context, route);
},
              onLogout: () {
                // TODO: implementar logout (ex: voltar para tela de login)
                debugPrint('Logout solicitado');
                // Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ),
          // Conteúdo principal (expande para o resto da tela)
          Expanded(
            child: Column(
              children: [
                // Header (ajuste se houver parâmetros obrigatórios)
                const Header(),
                // Área rolável do conteúdo
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32), // p-8
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 500, // min-h-[500px]
                        ),
                        padding: const EdgeInsets.all(48), // p-12
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12), // rounded-xl
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: const Center(
                          child: Text(
                            'italo',
                            style: TextStyle(
                              fontSize: 60, // text-6xl (approx)
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0A2540),
                            ),
                          ),
                        ),
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