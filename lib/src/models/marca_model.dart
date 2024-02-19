class Marca {
  final String id;
  final String nome;

  const Marca({
    required this.id,
    required this.nome,
  });

  factory Marca.fromJson(Map<String, dynamic> json) =>
      Marca(id: json['id'], nome: json['nome']);

  Map<String, dynamic> toJson() => {'id': id, 'nome': nome};

  Marca copyWith({
    String? id,
    String? nome,
  }) {
    return Marca(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }
}
