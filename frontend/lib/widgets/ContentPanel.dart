import 'package:flutter/material.dart';
import '../models/models.dart';

// --- ContentPanel Widget ---

class ContentPanel extends StatefulWidget {
  final Trail? trail;
  final List<Content> contents;
  final VoidCallback onAddVideo;
  final VoidCallback onAddPDF;
  final void Function(String id) onEditContent;
  final void Function(String id) onReplaceContent;
  final void Function(String id) onDeleteContent;

  const ContentPanel({
    super.key,
    this.trail,
    required this.contents,
    required this.onAddVideo,
    required this.onAddPDF,
    required this.onEditContent,
    required this.onReplaceContent,
    required this.onDeleteContent,
  });

  @override
  State<ContentPanel> createState() => _ContentPanelState();
}

class _ContentPanelState extends State<ContentPanel> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Se nenhuma trilha selecionada, exibe placeholder
    if (widget.trail == null) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.all(48), // p-12
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Color(0xFFF3F4F6), // gray-100
                child: Icon(
                  Icons.insert_drive_file_outlined,
                  size: 32,
                  color: Color(0xFF9CA3AF), // gray-400
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Selecione uma trilha para gerenciar o conteúdo',
                style: TextStyle(
                  color: Color(0xFF6B7280), // gray-500
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final trail = widget.trail!;

    // Filtra conteúdos baseado na pesquisa
    final filteredContents = widget.contents.where((content) {
      return content.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    // Contagens
    final videoCount = widget.contents.where((c) => c.type == ContentType.video).length;
    final pdfCount = widget.contents.where((c) => c.type == ContentType.pdf).length;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(24), // p-6
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho com nome e descrição da trilha + badges
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trail.name,
                      style: const TextStyle(
                        fontSize: 24, // text-2xl
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A2540),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      trail.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Badges de contagem
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.video_library_outlined, size: 16, color: Colors.blue.shade700),
                        const SizedBox(width: 6),
                        Text(
                          '$videoCount ${videoCount == 1 ? 'vídeo' : 'vídeos'}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.picture_as_pdf_outlined, size: 16, color: Colors.amber.shade700),
                        const SizedBox(width: 6),
                        Text(
                          '$pdfCount ${pdfCount == 1 ? 'PDF' : 'PDFs'}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.amber.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Barra de ações: botões + campo de pesquisa
          Row(
            children: [
              // Botão Adicionar Vídeo
              ElevatedButton.icon(
                onPressed: widget.onAddVideo,
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Adicionar Vídeo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              const SizedBox(width: 12),
              // Botão Adicionar PDF (outlined)
              OutlinedButton.icon(
                onPressed: widget.onAddPDF,
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Adicionar PDF'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFD4AF37),
                  side: const BorderSide(color: Color(0xFFD4AF37), width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              const Spacer(),
              // Campo de pesquisa
              SizedBox(
                width: 300, // max-w-xs
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => setState(() => _searchQuery = value),
                  decoration: InputDecoration(
                    hintText: 'Buscar conteúdo...',
                    prefixIcon: const Icon(Icons.search, size: 16, color: Color(0xFF9CA3AF)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF0A2540), width: 2),
                    ),
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Lista de conteúdos (scrollável)
          Flexible(
            fit: FlexFit.loose,
            child: filteredContents.isEmpty
                ? Center(
                    child: Text(
                      _searchQuery.isNotEmpty
                          ? 'Nenhum conteúdo encontrado'
                          : 'Nenhum conteúdo adicionado ainda',
                      style: const TextStyle(color: Color(0xFF9CA3AF)),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredContents.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final content = filteredContents[index];
                      return ContentCard(
                        type: content.type,
                        title: content.title,
                        uploadDate: content.uploadDate,
                        engagementData: content.engagementData,
                        views: content.views,
                        dropoffPoint: content.dropoffPoint,
                        onEdit: () => widget.onEditContent(content.id),
                        onReplace: () => widget.onReplaceContent(content.id),
                        onDelete: () => widget.onDeleteContent(content.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// --- ContentCard Widget (básico) ---
// Caso você já tenha esse componente em arquivo separado, pode removê-lo daqui.

class ContentCard extends StatelessWidget {
  final ContentType type;
  final String title;
  final String uploadDate;
  final List<double> engagementData;
  final int views;
  final String dropoffPoint;
  final VoidCallback onEdit;
  final VoidCallback onReplace;
  final VoidCallback onDelete;

  const ContentCard({
    super.key,
    required this.type,
    required this.title,
    required this.uploadDate,
    required this.engagementData,
    required this.views,
    required this.dropoffPoint,
    required this.onEdit,
    required this.onReplace,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Ícone do tipo
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: type == ContentType.video ? Colors.blue.shade50 : Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              type == ContentType.video ? Icons.play_circle_outline : Icons.picture_as_pdf_outlined,
              color: type == ContentType.video ? Colors.blue.shade700 : Colors.amber.shade700,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          // Informações
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 12, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      uploadDate,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.visibility_outlined, size: 12, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      '$views visualizações',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.trending_down, size: 12, color: Colors.orange.shade600),
                    const SizedBox(width: 4),
                    Text(
                      'Drop-off: $dropoffPoint',
                      style: TextStyle(fontSize: 12, color: Colors.orange.shade600),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Mini gráfico de engajamento (simplificado)
                SizedBox(
                  height: 24,
                  child: _MiniSparkline(data: engagementData),
                ),
              ],
            ),
          ),
          // Botões de ação
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            onSelected: (value) {
              switch (value) {
                case 'edit':
                  onEdit();
                  break;
                case 'replace':
                  onReplace();
                  break;
                case 'delete':
                  onDelete();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    Icon(Icons.edit_outlined, size: 18),
                    SizedBox(width: 8),
                    Text('Editar'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'replace',
                child: Row(
                  children: [
                    Icon(Icons.swap_horiz, size: 18),
                    SizedBox(width: 8),
                    Text('Substituir'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, size: 18, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Excluir', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget auxiliar para o mini gráfico sparkline
class _MiniSparkline extends StatelessWidget {
  final List<double> data;
  const _MiniSparkline({required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SparklinePainter(data),
      size: const Size(double.infinity, 24),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> data;
  _SparklinePainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final maxValue = data.reduce((a, b) => a > b ? a : b);
    final minValue = data.reduce((a, b) => a < b ? a : b);
    final range = maxValue - minValue;

    final paint = Paint()
      ..color = const Color(0xFF0A2540)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final stepX = size.width / (data.length - 1);
    final path = Path();

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final normalizedY = range == 0 ? 0.5 : (data[i] - minValue) / range;
      final y = size.height - (normalizedY * (size.height - 4) + 2);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}