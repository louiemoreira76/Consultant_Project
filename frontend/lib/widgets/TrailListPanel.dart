import 'package:flutter/material.dart';
import '../models/models.dart';

class TrailListPanel extends StatelessWidget {
  final List<Trail> trails;
  final String? selectedTrailId;
  final void Function(String id) onSelectTrail;
  final VoidCallback onAddTrail;
  final void Function(String id) onEditTrail;
  final void Function(String id) onDeleteTrail;

  const TrailListPanel({
    super.key,
    required this.trails,
    this.selectedTrailId,
    required this.onSelectTrail,
    required this.onAddTrail,
    required this.onEditTrail,
    required this.onDeleteTrail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(24), // p-6
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cabeçalho
          const Text(
            'Trilhas de Conhecimento',
            style: TextStyle(
              fontSize: 20, // text-xl
              fontWeight: FontWeight.w600, // font-semibold
              color: Color(0xFF0A2540),
            ),
          ),
          const SizedBox(height: 16), // mb-4
          // Botão Nova Trilha
          OutlinedButton.icon(
            onPressed: onAddTrail,
            icon: const Icon(Icons.add, size: 20),
            label: const Text('Nova Trilha'),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFD4AF37),
              side: const BorderSide(color: Color(0xFFD4AF37), width: 2),
              padding: const EdgeInsets.symmetric(vertical: 12), // py-3
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.transparent,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ).copyWith(
              // hover effect: mudar cor de fundo e texto (para web)
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return const Color(0xFFD4AF37);
                  }
                  return null;
                },
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return Colors.white;
                  }
                  return const Color(0xFFD4AF37);
                },
              ),
            ),
          ),
          const SizedBox(height: 24), // mb-6
          // Lista de trilhas (expansível)
          Flexible(
            child: trails.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhuma trilha criada ainda',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: trails.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final trail = trails[index];
                      final isSelected = trail.id == selectedTrailId;
                      return _TrailListItem(
                        trail: trail,
                        isSelected: isSelected,
                        onSelect: () => onSelectTrail(trail.id),
                        onEdit: () => onEditTrail(trail.id),
                        onDelete: () => onDeleteTrail(trail.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _TrailListItem extends StatefulWidget {
  final Trail trail;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _TrailListItem({
    required this.trail,
    required this.isSelected,
    required this.onSelect,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<_TrailListItem> createState() => _TrailListItemState();
}

class _TrailListItemState extends State<_TrailListItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Define cores baseadas na seleção e hover
    Color borderColor;
    Color? backgroundColor;

    if (widget.isSelected) {
      borderColor = const Color(0xFF0A2540);
      backgroundColor = const Color(0xFF0A2540).withOpacity(0.05);
    } else {
      borderColor = _isHovered
          ? const Color(0xFF0A2540).withOpacity(0.3)
          : Colors.grey.shade200;
      backgroundColor = _isHovered ? Colors.grey.shade50 : null;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onSelect,
        child: Container(
          padding: const EdgeInsets.all(16), // p-4
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.trail.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: widget.isSelected
                      ? const Color(0xFF0A2540)
                      : const Color(0xFF1F2937), // gray-800
                ),
              ),
              const SizedBox(height: 4), // mb-1
              Text(
                widget.trail.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600, // text-gray-500
                ),
              ),
              const SizedBox(height: 8), // mb-2
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.trail.contentCount} ${widget.trail.contentCount == 1 ? 'conteúdo' : 'conteúdos'}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B7280), // gray-500
                    ),
                  ),
                  // Botões de ação (aparecem no hover)
                  AnimatedOpacity(
                    opacity: _isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 150),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Botão Editar
                        _ActionButton(
                          icon: Icons.edit_outlined,
                          onPressed: widget.onEdit,
                          tooltip: 'Editar',
                          hoverColor: const Color(0xFF0A2540),
                        ),
                        const SizedBox(width: 4),
                        // Botão Excluir
                        _ActionButton(
                          icon: Icons.delete_outline,
                          onPressed: widget.onDelete,
                          tooltip: 'Excluir',
                          hoverColor: Colors.red.shade600,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;
  final Color hoverColor;

  const _ActionButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    required this.hoverColor,
  });

   @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.transparent,
          ),
          child: Icon(
            icon,
            size: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
