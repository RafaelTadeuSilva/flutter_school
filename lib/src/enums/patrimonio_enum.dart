enum TipoPatrimonio {
  eletronico(1, 'Eletrônico'),
  ferramenta(2, 'Ferramenta'),
  informatica(3, 'Informática'),
  movel(4, 'Móvel');

  const TipoPatrimonio(this.id, this.nome);
  final int id;
  final String nome;

  static TipoPatrimonio getByID(int id) => values.firstWhere((e) => e.id == id);
  static String getNome(id) => values.firstWhere((e) => e.id == id).name;
}

enum StatusPatrimonio {
  ativo(1, 'Ativo'),
  conserto(2, 'Conserto'),
  baixado(3, 'Baixado');

  const StatusPatrimonio(this.id, this.nome);
  final int id;
  final String nome;

  static StatusPatrimonio getByID(int id) =>
      values.firstWhere((e) => e.id == id);
  static String getNome(id) => values.firstWhere((e) => e.id == id).name;
}
