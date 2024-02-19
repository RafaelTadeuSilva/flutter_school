class Local {
  final String id;
  final String nome;
  final String andar;

  const Local({
    required this.id,
    required this.nome,
    required this.andar,
  });

  factory Local.fromJson(Map<String, dynamic> json) =>
      Local(id: json['id'], nome: json['nome'], andar: json['andar']);

  Map<String, dynamic> toJson() => {'id': id, 'nome': nome, 'andar': andar};

  Local copyWith({
    String? id,
    String? nome,
    String? andar,
  }) {
    return Local(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      andar: andar ?? this.andar,
    );
  }
}
