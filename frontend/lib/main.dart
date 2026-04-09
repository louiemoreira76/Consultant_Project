import 'package:flutter/material.dart';
import 'screens/Dashboard.dart';
import 'screens/Mentorados.dart';
import 'screens/TrailManagement.dart';
import 'screens/relatorios_page.dart';
import 'screens/chat_suporte_page.dart';
import 'screens/configuracoes_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consultora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF0F4F8),
      ),
      initialRoute: '/admin/dashboard', // <-- rota inicial correta
      routes: {
        '/admin/dashboard': (context) => const Dashboard(),
        '/admin/mentorados': (context) => const MentoradosPage(),
        '/admin/trilhas': (context) => const TrailManagementPage(),
        '/admin/relatorios': (context) => const RelatoriosPage(),
        '/admin/chat': (context) => const ChatSuportePage(),
        '/admin/configuracoes': (context) => const ConfiguracoesPage(),
      },
    );
  }
}
