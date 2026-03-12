import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../services/api_service.dart';
import '../widgets/cliente_card.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});
  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  late Future<List<Cliente>> _future;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    setState(() { _future = ApiService.getClientes(); });
  }

  void _abrirForm() {
    final nomeCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final segCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Novo Cliente'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: nomeCtrl, decoration: const InputDecoration(labelText: 'Nome')),
          TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
          TextField(controller: segCtrl, decoration: const InputDecoration(labelText: 'Segmento')),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await ApiService.createCliente({
                'nome': nomeCtrl.text,
                'email': emailCtrl.text,
                'segmento': segCtrl.text,
              });
              _load();
            },
            child: const Text('Criar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _load)],
      ),
      floatingActionButton: FloatingActionButton(onPressed: _abrirForm, child: const Icon(Icons.add)),
      body: FutureBuilder<List<Cliente>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}', style: const TextStyle(color: Colors.red)));
          }
          final clientes = snapshot.data!;
          if (clientes.isEmpty) return const Center(child: Text('Nenhum cliente'));
          return ListView.builder(
            itemCount: clientes.length,
            itemBuilder: (_, i) => ClienteCard(
              cliente: clientes[i],
              onDelete: () async {
                await ApiService.deleteCliente(clientes[i].id);
                _load();
              },
            ),
          );
        },
      ),
    );
  }
}