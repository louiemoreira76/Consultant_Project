import 'package:flutter/material.dart';
import '../widgets/PlaceholderPage.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Configurações',
      description: 'Personalize sua plataforma e preferências',
      icon: Icons.settings_outlined,
      activeSidebarItem: 'Configurações',
    );
  }
}