import 'package:flutter/material.dart';
import '../models/models.dart'; 

class AddTrailModal extends StatefulWidget {
  final Trail? editingTrail;
  final void Function(String name, String description) onSave;

  const AddTrailModal({
    super.key,
    required this.onSave,
    this.editingTrail,
  });

  static Future<void> show(
    BuildContext context, {
    Trail? editingTrail,
    required void Function(String name, String description) onSave,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (_) => AddTrailModal(editingTrail: editingTrail, onSave: onSave),
    );
  }

  @override
  State<AddTrailModal> createState() => _AddTrailModalState();
}

class _AddTrailModalState extends State<AddTrailModal> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _descCtrl;

  static const _gold = Color(0xFFD4AF37);
  static const _darkBlue = Color(0xFF0A2540);

  bool get _isEditing => widget.editingTrail != null;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.editingTrail?.name ?? '');
    _descCtrl = TextEditingController(text: widget.editingTrail?.description ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    widget.onSave(_nameCtrl.text.trim(), _descCtrl.text.trim());
    Navigator.of(context).pop();
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
                      _isEditing ? 'Editar Trilha' : 'Nova Trilha',
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

                // ── Nome ──
                _Label('Nome da Trilha *'),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _nameCtrl,
                  decoration: _inputDecoration('Ex: Recuperação de Créditos Tributários'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 16),

                // ── Descrição ──
                _Label('Descrição *'),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _descCtrl,
                  decoration: _inputDecoration('Descreva o objetivo e conteúdo desta trilha...'),
                  maxLines: 4,
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Campo obrigatório' : null,
                ),
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
                          _isEditing ? 'Salvar Alterações' : 'Criar Trilha',
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