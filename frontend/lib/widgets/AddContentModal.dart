import 'package:flutter/material.dart';
import '../models/models.dart';

class AddContentModal extends StatefulWidget {
  final ContentType contentType;
  final Content? editingContent;
  final void Function(ContentType type, String title, String description) onSave;

  const AddContentModal({
    super.key,
    required this.contentType,
    required this.onSave,
    this.editingContent,
  });

  // Helper estático para abrir o modal facilmente
  static Future<void> show(
    BuildContext context, {
    required ContentType contentType,
    Content? editingContent,
    required void Function(ContentType, String, String) onSave,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (_) => AddContentModal(
        contentType: contentType,
        editingContent: editingContent,
        onSave: onSave,
      ),
    );
  }

  @override
  State<AddContentModal> createState() => _AddContentModalState();
}

class _AddContentModalState extends State<AddContentModal> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;
  String? _fileName;

  static const _gold = Color(0xFFD4AF37);
  static const _darkBlue = Color(0xFF0A2540);

  bool get _isEditing => widget.editingContent != null;

  String get _typeLabel => widget.contentType == ContentType.video ? 'Vídeo' : 'PDF';

  String get _titlePlaceholder => widget.contentType == ContentType.video
      ? 'Ex: Aula 01 - Introdução ao PIS/COFINS'
      : 'Ex: Checklist de Documentos';

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.editingContent?.title ?? '');
    _descCtrl = TextEditingController(text: widget.editingContent?.description ?? '');
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    widget.onSave(widget.contentType, _titleCtrl.text.trim(), _descCtrl.text.trim());
    Navigator.of(context).pop();
  }

  // Simula seleção de arquivo (sem lib externa)
  void _pickFile() {
    setState(() => _fileName = 'arquivo_selecionado.${widget.contentType == ContentType.video ? "mp4" : "pdf"}');
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Header ──
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_isEditing ? "Editar" : "Adicionar"} $_typeLabel',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: _darkBlue,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                      style: IconButton.styleFrom(foregroundColor: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ── Título ──
                _Label('Título *'),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _titleCtrl,
                  decoration: _inputDecoration(_titlePlaceholder),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 16),

                // ── Descrição ──
                _Label('Descrição *'),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _descCtrl,
                  decoration: _inputDecoration('Descreva o conteúdo e objetivos...'),
                  maxLines: 3,
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 16),

                // ── Upload (só ao criar) ──
                if (!_isEditing) ...[
                  _Label(
                    widget.contentType == ContentType.video
                        ? 'Arquivo (MP4, AVI, MOV) *'
                        : 'Arquivo (PDF) *',
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: _pickFile,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _fileName != null ? _darkBlue : Colors.grey.shade300,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade50,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.upload_outlined,
                              color: _fileName != null ? _darkBlue : Colors.grey),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _fileName ?? 'Clique para selecionar arquivo',
                              style: TextStyle(
                                fontSize: 13,
                                color: _fileName != null ? _darkBlue : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ] else
                  const SizedBox(height: 24),

                // ── Botões ──
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: Colors.grey),
                          foregroundColor: Colors.grey.shade700,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Cancelar', style: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: _submit,
                        style: FilledButton.styleFrom(
                          backgroundColor: _gold,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          _isEditing ? 'Salvar Alterações' : 'Adicionar',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _darkBlue.withOpacity(0.6), width: 2),
        ),
      );
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87),
    );
  }
}