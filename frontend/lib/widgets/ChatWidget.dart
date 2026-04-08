import 'package:flutter/material.dart';

// Modelo de mensagem
class ChatMessage {
  final int id;
  final String studentName;
  final String studentAvatar;
  final String message;
  final String time;
  final bool unread;

  const ChatMessage({
    required this.id,
    required this.studentName,
    required this.studentAvatar,
    required this.message,
    required this.time,
    required this.unread,
  });
}

// Mock de dados
const List<ChatMessage> mockMessages = [
  ChatMessage(
    id: 1,
    studentName: 'Carlos Silva',
    studentAvatar: 'CS',
    message: 'Professora, tenho uma dúvida sobre o cálculo de PIS/COFINS no regime...',
    time: 'Há 10 min',
    unread: true,
  ),
  ChatMessage(
    id: 2,
    studentName: 'Ana Rodrigues',
    studentAvatar: 'AR',
    message: 'Como faço para aplicar a recuperação de créditos em empresas do...',
    time: 'Há 1 hora',
    unread: true,
  ),
  ChatMessage(
    id: 3,
    studentName: 'Mariana Costa',
    studentAvatar: 'MC',
    message: 'Obrigada pela explicação sobre ICMS-ST! Ficou muito claro agora.',
    time: 'Há 2 horas',
    unread: false,
  ),
];

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final unreadCount = mockMessages.where((m) => m.unread).length;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.message_outlined,
                      size: 20,
                      color: Color(0xFF0A2540),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Últimas Mensagens',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A2540),
                      ),
                    ),
                  ],
                ),
                if (unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '$unreadCount ${unreadCount == 1 ? 'nova' : 'novas'}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.red.shade600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF3F4F6)),
          // Lista de mensagens
          ...mockMessages.map((msg) => _ChatMessageItem(message: msg)),
          // Rodapé
          const Divider(height: 1, color: Color(0xFFF3F4F6)),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
            child: InkWell(
              onTap: () {
                // Navegar para tela de mensagens
              },
              borderRadius: BorderRadius.circular(4),
              child: const Text(
                'Ver todas as mensagens →',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0A2540),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMessageItem extends StatefulWidget {
  final ChatMessage message;
  const _ChatMessageItem({required this.message});

  @override
  State<_ChatMessageItem> createState() => _ChatMessageItemState();
}

class _ChatMessageItemState extends State<_ChatMessageItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: () {
          // Navegar para conversa individual
        },
        child: Container(
          color: widget.message.unread
              ? Colors.blue.shade50.withOpacity(0.3)
              : (_isHovered ? Colors.grey.shade50 : Colors.transparent),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar circular
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF0A2540),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    widget.message.studentAvatar,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Conteúdo da mensagem
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nome e horário
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.message.studentName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111827),
                          ),
                        ),
                        Text(
                          widget.message.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Pré-visualização da mensagem (truncada)
                    Text(
                      widget.message.message,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    // Botão "Responder" se não lida
                    if (widget.message.unread) ...[
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          // Ação de resposta rápida
                        },
                        borderRadius: BorderRadius.circular(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.send_outlined,
                              size: 12,
                              color: const Color(0xFFD4AF37),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Responder',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFD4AF37),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}