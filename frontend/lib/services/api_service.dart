import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';

//const String _base = 'http://10.0.2.2:3000/api'; // Android emulator
 const String _base = 'http://localhost:3000/api'; // iOS / Web

class ApiService {
  static Future<List<Cliente>> getClientes() async {
    final res = await http.get(Uri.parse('$_base/'));
    final body = jsonDecode(res.body);
    if (res.statusCode != 200) throw Exception(body['message'] ?? 'Erro ao buscar clientes');
    final data = body['data'];
    if (data == null) return [];
    return (data as List).map((e) => Cliente.fromJson(e)).toList();
  }

  static Future<void> createCliente(Map<String, dynamic> dados) async {
    final res = await http.post(
      Uri.parse('$_base/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(dados),
    );
    final body = jsonDecode(res.body);
    if (res.statusCode != 201) throw Exception(body['message'] ?? 'Erro ao criar cliente');
  }

  static Future<void> deleteCliente(String id) async {
    final res = await http.delete(Uri.parse('$_base/$id'));
    if (res.statusCode != 200) throw Exception('Erro ao deletar cliente');
  }
}