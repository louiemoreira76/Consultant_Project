import 'package:flutter/material.dart';
import '../widgets/PlaceholderPage.dart';

class ChatSuportePage extends StatelessWidget {
  const ChatSuportePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Chat de Suporte',
      description: 'Central de atendimento e suporte aos mentorados',
      icon: Icons.message_outlined,
      activeSidebarItem: 'Chat de Suporte',
    );
  }
}