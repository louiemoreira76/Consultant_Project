class Cliente {
  final String id, nome, email, segmento;

  Cliente({
    required this.id,
    required this.nome,
    required this.email,
    required this.segmento,
  });

  factory Cliente.fromJson(Map<String, dynamic> j) => Cliente(
    id: j['id'] ?? '',
    nome: j['nome'] ?? '',
    email: j['email'] ?? '',
    segmento: j['segmento'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'email': email,
    'segmento': segmento,
  };
}
