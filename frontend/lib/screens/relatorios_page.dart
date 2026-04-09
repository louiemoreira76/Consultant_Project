import 'package:flutter/material.dart';
import '../widgets/PlaceholderPage.dart';

class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Relatórios',
      description: 'Análises detalhadas de desempenho e engajamento',
      icon: Icons.bar_chart,
      activeSidebarItem: 'Relatórios',
    );
  }
}