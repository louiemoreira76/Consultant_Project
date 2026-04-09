// lib/screens/trail_management.dart
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/Sidebar.dart';
import '../widgets/Header.dart';
import '../widgets/TrailListPanel.dart';
import '../widgets/ContentPanel.dart';
import '../widgets/AddTrailModal.dart';
import '../widgets/AddContentModal.dart';

// Mock de dados iniciais
final List<Trail> initialTrails = [
  Trail(id: '1', name: 'Recuperação de Créditos Tributários', description: '...', contentCount: 8),
  Trail(id: '2', name: 'Planejamento Societário', description: '...', contentCount: 5),
  Trail(id: '3', name: 'ICMS-ST e Substituição Tributária', description: '...', contentCount: 6),
];

final List<Content> initialContents = [
  Content(
    id: '1',
    trailId: '1',
    type: ContentType.video,
    title: 'Aula 01 - Introdução ao PIS/COFINS',
    description: 'Fundamentos do regime cumulativo e não-cumulativo',
    uploadDate: '15/03/2026',
    engagementData: [85, 92, 88, 95, 82, 78, 71, 68, 62, 58, 55, 52],
    views: 187,
    dropoffPoint: '42%',
  ),
  // ... demais conteúdos
  Content(
    id: '5',
    trailId: '2',
    type: ContentType.video,
    title: 'Reestruturação Societária - Parte 1',
    description: 'Análise de cenários e oportunidades',
    uploadDate: '10/03/2026',
    engagementData: [92, 90, 87, 85, 82, 80, 78, 75, 72, 70],
    views: 134,
    dropoffPoint: '35%',
  ),
];

class TrailManagementPage extends StatefulWidget {
  const TrailManagementPage({super.key});

  @override
  State<TrailManagementPage> createState() => _TrailManagementPageState();
}

class _TrailManagementPageState extends State<TrailManagementPage> {
  late List<Trail> trails;
  late List<Content> contents;
  String? selectedTrailId;

  @override
  void initState() {
    super.initState();
    trails = List<Trail>.from(initialTrails);
    contents = List.from(initialContents);
    selectedTrailId = '1';
  }

  Trail? get selectedTrail =>
      trails.cast<Trail?>().firstWhere((t) => t?.id == selectedTrailId, orElse: () => null);

  List<Content> get trailContents =>
      contents.where((c) => c.trailId == selectedTrailId).toList();

  // --- Handlers de Trilhas ---

void _openTrailModal({Trail? trail}) {
    AddTrailModal.show(
      context,
      editingTrail: trail,
      onSave: (name, description) {
        setState(() {
          if (trail == null) {
            final newTrail = Trail(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              name: name,
              description: description,
              contentCount: 0,
            );
            trails.add(newTrail);
            selectedTrailId = newTrail.id;
          } else {
            final index = trails.indexWhere((t) => t.id == trail.id);
            if (index != -1) {
              trails[index].name = name;
              trails[index].description = description;
            }
          }
        });
      },
    );
  }

  void handleAddTrail() => _openTrailModal();
  void handleEditTrail(String id) {
    final trail = trails.firstWhere((t) => t.id == id);
    _openTrailModal(trail: trail);
  }

  Future<void> handleDeleteTrail(String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text(
          'Tem certeza que deseja excluir esta trilha? Todos os conteúdos associados serão removidos.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        trails.removeWhere((t) => t.id == id);
        contents.removeWhere((c) => c.trailId == id);
        if (selectedTrailId == id) {
          selectedTrailId = trails.isNotEmpty ? trails.first.id : null;
        }
      });
    }
  }

  // --- Handlers de Conteúdo ---

  void _openContentModal({Content? content, required ContentType type}) {
    AddContentModal.show(
      context,
      contentType: type,
      editingContent: content,
      onSave: (type, title, description) {
        if (selectedTrailId == null) return;
        setState(() {
          if (content == null) {
            final newContent = Content(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              trailId: selectedTrailId!,
              type: type,
              title: title,
              description: description,
              uploadDate: _formatDate(DateTime.now()),
              engagementData: List.generate(12, (_) => _randomInt(60, 100).toDouble()),
              views: _randomInt(50, 250),
              dropoffPoint: type == ContentType.video ? '${_randomInt(30, 60)}%' : 'N/A',
            );
            contents.add(newContent);
            final trailIndex = trails.indexWhere((t) => t.id == selectedTrailId);
            if (trailIndex != -1) trails[trailIndex].contentCount += 1;
          } else {
            final index = contents.indexWhere((c) => c.id == content.id);
            if (index != -1) {
              contents[index].title = title;
              contents[index].description = description;
            }
          }
        });
      },
    );
  }

  void handleAddVideo() => _openContentModal(type: ContentType.video);
  void handleAddPDF() => _openContentModal(type: ContentType.pdf);

  void handleEditContent(String id) {
    final content = contents.firstWhere((c) => c.id == id);
    _openContentModal(content: content, type: content.type);
  }

  void handleReplaceContent(String id) {
    final content = contents.firstWhere((c) => c.id == id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Funcionalidade de substituição de arquivo para: ${content.title}\nEm desenvolvimento...'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> handleDeleteContent(String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text('Tem certeza que deseja remover este conteúdo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        contents.removeWhere((c) => c.id == id);
        if (selectedTrailId != null) {
          final trailIndex = trails.indexWhere((t) => t.id == selectedTrailId);
          if (trailIndex != -1) {
            trails[trailIndex].contentCount -= 1;
          }
        }
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  int _randomInt(int min, int max) {
    return min + (DateTime.now().millisecondsSinceEpoch % (max - min));
  }

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
              activeItem: 'Trilhas de Conteúdo',
onNavigate: (route) {
  debugPrint('Navegar para: $route');
  Navigator.pushReplacementNamed(context, route);
},
              onLogout: () {
                // Navegar para login
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
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gerenciamento de Conteúdo',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A2540),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Organize trilhas de conhecimento e seus materiais',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TrailListPanel (1/4)
                            Flexible(
                              flex: 1,
                              child: TrailListPanel(
                                trails: trails,   // <-- Passa a lista diretamente
                                selectedTrailId: selectedTrailId,
                                onSelectTrail: (id) => setState(() => selectedTrailId = id),
                                onAddTrail: handleAddTrail,
                                onEditTrail: handleEditTrail,
                                onDeleteTrail: handleDeleteTrail,
                              ),
                            ),
                            const SizedBox(width: 24),
                            // ContentPanel (3/4)
                            Flexible(
                              flex: 3,
                              child: ContentPanel(
                                trail: selectedTrail,
                                contents: trailContents,  // <-- Passa a lista diretamente
                                onAddVideo: handleAddVideo,
                                onAddPDF: handleAddPDF,
                                onEditContent: handleEditContent,
                                onReplaceContent: handleReplaceContent,
                                onDeleteContent: handleDeleteContent,
                              ),
                            ),
                          ],
                        ),
                      ],
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