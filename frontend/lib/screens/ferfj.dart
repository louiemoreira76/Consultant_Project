import 'package:flutter/material.dart';
import 'package:pi_app_desktop/widgets/Easy_Gif_Component.dart';
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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nomeCtrl, decoration: const InputDecoration(labelText: 'Nome')),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: segCtrl, decoration: const InputDecoration(labelText: 'Segmento')),
          ],
        ),
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
      
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirForm, 
        child: const Icon(Icons.add)
      ),

      // TUDO DENTRO DO body USA UM Stack
      body: Stack(
        children: [
          
          Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue,      // começa azul
            Colors.purple,    // vai pro roxo
            Colors.pink,      // termina rosa
          ],
        ),
      ),
    ),



          // 1. PRIMEIRO: a lista de clientes (fundo)
          FutureBuilder<List<Cliente>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Erro: ${snapshot.error}', 
                    style: const TextStyle(color: Colors.red)
                  ),
                );
              }
              final clientes = snapshot.data!;
              
              if (clientes.isEmpty) {
                return const Center(child: Text('Nenhum cliente'));
              }
              
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

          //quadrado vermelho extremamente simples
         Positioned(
            left: 20,
            top: 100, 

            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3),
                color: Colors.transparent, 
              ),

              child: const Center(
                child: Text(
                  'Quadrado',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          //Círculo com borda azul 
          Positioned(
            right: 20,
            top: 150,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 3),
                color: Colors.transparent,
              ),
              child: const Center(
                child: Text(
                  'Círculo',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),


          // GIF animado COMPONENTE(WIDGET)
          const GifCantoSuperior(
            url: 'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExaG55c3k3eGpzNmx0bDdzNjRkcHpnNGVmcWIwd2s1N3hoZjllcnh4dSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/TLaDluUpSbCKsSskMm/giphy.gif',
            width: 150,
            height: 150,
            top: -30,
            left: 470,
          ),

          //UMA IMAGEM NOSSAAAA MT DIFICIL 😢😭😭😢
           Positioned(
            top: 60,
            left: 0,
            bottom: 0,
            right: 130,
            child: Center(
                    child: Image.network(
              'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.licdn.com%2Fdms%2Fimage%2Fv2%2FC4D22AQFRZwY28hVxtg%2Ffeedshare-shrink_2048_1536%2Ffeedshare-shrink_2048_1536%2F0%2F1673789791604%3Fe%3D2147483647%26v%3Dbeta%26t%3DQk3KRvWKRxAE2uGwfi6hfykSkwClgTyvoYTRpWrKb5c&f=1&nofb=1&ipt=e83d0a0631ef5986ee33aa390a45d92ac23826fef30bfb085d59133a7ff8cd18', // imagem aleatória (pode ser local também)
              width: 500,
              height: 500,
              fit: BoxFit.cover,
            ),
            ),
          ),
        ],
      ),
    );
  }
}