import 'package:flutter/material.dart';
import 'screens/clientes_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consultora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color(0xFF1A56DB), useMaterial3: true),
      home: const ClientesScreen(),
    );
  }
}