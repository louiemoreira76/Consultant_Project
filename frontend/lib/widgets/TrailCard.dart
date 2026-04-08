import 'package:flutter/material.dart';

// Modelo de dados
class Trail {
  final int id;
  final String title;
  final int videoCount;
  final int pdfCount;
  final Color color;

  const Trail({
    required this.id,
    required this.title,
    required this.videoCount,
    required this.pdfCount,
    required this.color,
  });
}

// Mock de dados
const List<Trail> mockTrails = [
  Trail(
    id: 1,
    title: 'Recuperação de Créditos',
    videoCount: 12,
    pdfCount: 8,
    color: Color(0xFF0A2540),
  ),
  Trail(
    id: 2,
    title: 'Planejamento Tributário',
    videoCount: 15,
    pdfCount: 10,
    color: Color(0xFF5A6C7D),
  ),
  Trail(
    id: 3,
    title: 'Compliance Fiscal',
    videoCount: 10,
    pdfCount: 6,
    color: Color(0xFF3B82F6),
  ),
  Trail(
    id: 4,
    title: 'ICMS na Prática',
    videoCount: 8,
    pdfCount: 5,
    color: Color(0xFF10B981),
  ),
];

class TrailCards extends StatelessWidget {
  const TrailCards({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Text(
              'Trilhas Ativas',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0A2540),
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF3F4F6)),
          // Lista de cards (espaçamento p-4)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: mockTrails.map((trail) => _TrailCard(trail: trail)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrailCard extends StatefulWidget {
  final Trail trail;
  const _TrailCard({required this.trail});

  @override
  State<_TrailCard> createState() => _TrailCardState();
}

class _TrailCardState extends State<_TrailCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered ? const Color(0xFF0A2540) : Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Linha superior: título + bolinha colorida
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.trail.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF111827),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: widget.trail.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Ícones de contagem de vídeos e PDFs
              Row(
                children: [
                  _CountIndicator(
                    icon: Icons.video_library_outlined,
                    count: widget.trail.videoCount,
                    label: 'vídeos',
                  ),
                  const SizedBox(width: 16),
                  _CountIndicator(
                    icon: Icons.insert_drive_file_outlined,
                    count: widget.trail.pdfCount,
                    label: 'PDFs',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Botão de gerenciar conteúdo
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Ação ao clicar no botão
                  },
                  icon: const Icon(Icons.settings_outlined, size: 16),
                  label: const Text('Gerenciar Conteúdo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isHovered
                        ? const Color(0xFFD4AF37)
                        : Colors.grey.shade50,
                    foregroundColor: _isHovered
                        ? const Color(0xFF0A2540)
                        : Colors.grey.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CountIndicator extends StatelessWidget {
  final IconData icon;
  final int count;
  final String label;

  const _CountIndicator({
    required this.icon,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade600),
        const SizedBox(width: 6),
        Text(
          '$count $label',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}