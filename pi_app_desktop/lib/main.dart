import 'package:flutter/material.dart'; //Material Design (padrão de design do Google)

void main() {
  runApp(const MyApp());
}

// Widget raiz do aplicativo
class MyApp extends StatelessWidget {  //interface IMUTAVEL
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Esquema de cores baseado no roxo
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Tela Inicial'),
    );
  }
}

// Tela principal (com estado)
class MyHomePage extends StatefulWidget { //Widget que possui estado mutável.
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Estado da tela principal
class _MyHomePageState extends State<MyHomePage> { //Gerencia o estado do widget MyHomePage. O nome começa com _ para indicar que é privada 
  int _counter = 0;

  // Incrementa o contador e atualiza a interface
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Botão pressionado vezes:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}