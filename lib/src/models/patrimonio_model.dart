import 'package:flutter_school/export.dart';

class Patrimonio {
  final String id;
  final String numeroPatrimonio;
  final String descricao;
  final String idCompra;
  final Marca marca;
  final String modelo;
  final TipoPatrimonio tipo;
  final StatusPatrimonio status;
  final Local local;
  final String observacao;
  final DateTime dataCadastro;
  final DateTime dataAtualizacao;
  final String idUsuarioAtualizacao;

  const Patrimonio({
    required this.id,
    required this.numeroPatrimonio,
    required this.descricao,
    required this.idCompra,
    required this.marca,
    required this.modelo,
    required this.tipo,
    required this.status,
    required this.local,
    required this.observacao,
    required this.dataCadastro,
    required this.dataAtualizacao,
    required this.idUsuarioAtualizacao,
  });

  factory Patrimonio.fromJson(Map<String, dynamic> json) => Patrimonio(
        id: json['id'],
        numeroPatrimonio: json['numeroPatrimonio'],
        descricao: json['descricao'],
        idCompra: json['idCompra'],
        marca: Marca.fromJson(json['marca']),
        modelo: json['modelo'],
        tipo: TipoPatrimonio.getByID(json['tipo']),
        status: StatusPatrimonio.getByID(json['status']),
        local: Local.fromJson(json['local']),
        observacao: json['observacao'],
        dataCadastro: DateTime.parse(json['dataCadastro']),
        dataAtualizacao: DateTime.parse(json['dataAtualizacao']),
        idUsuarioAtualizacao: json['idUsuarioAtualizacao'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'numeroPatrimonio': numeroPatrimonio,
        'descricao': descricao,
        'idCompra': idCompra,
        'marca': marca.toJson(),
        'modelo': modelo,
        'tipo': tipo.id,
        'status': status.id,
        'local': local.toJson(),
        'observacao': observacao,
        'dataCadastro': dataCadastro.toIso8601String(),
        'dataAtualizacao': dataAtualizacao.toIso8601String(),
        'idUsuarioAtualizacao': idUsuarioAtualizacao,
      };

  Patrimonio copyWith({
    String? id,
    String? numeroPatrimonio,
    String? descricao,
    String? idCompra,
    Marca? marca,
    String? modelo,
    TipoPatrimonio? tipo,
    StatusPatrimonio? status,
    Local? local,
    String? observacao,
    DateTime? dataCadastro,
    DateTime? dataAtualizacao,
    String? idUsuarioAtualizacao,
  }) {
    return Patrimonio(
      id: id ?? this.id,
      numeroPatrimonio: numeroPatrimonio ?? this.numeroPatrimonio,
      descricao: descricao ?? this.descricao,
      idCompra: idCompra ?? this.idCompra,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      tipo: tipo ?? this.tipo,
      status: status ?? this.status,
      local: local ?? this.local,
      observacao: observacao ?? this.observacao,
      dataCadastro: dataCadastro ?? this.dataCadastro,
      dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
      idUsuarioAtualizacao: idUsuarioAtualizacao ?? this.idUsuarioAtualizacao,
    );
  }
}
