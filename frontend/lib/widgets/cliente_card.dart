import 'package:flutter/material.dart';
import '../models/cliente.dart';

class ClienteCard extends StatelessWidget {
  final Cliente cliente;
  final VoidCallback onDelete;

  const ClienteCard({super.key, required this.cliente, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(cliente.nome[0].toUpperCase())),
      title: Text(cliente.nome),
      subtitle: Text('${cliente.email} · ${cliente.segmento}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}