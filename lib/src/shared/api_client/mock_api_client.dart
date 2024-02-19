import 'dart:convert';

import 'package:flutter_school/src/shared/api_client/api_client.dart';

class MockApiClient implements ApiClient {
  @override
  Future<bool> deleteOne(String tabela, String params) async {
    return true;
  }

  @override
  Future<List<Map<String, dynamic>>> getData(
      String tabela, String params) async {
    return returnList(tabela);
  }

  @override
  Future<Map<String, dynamic>> getOne(String tabela, String params) async {
    return returnOne(tabela);
  }

  @override
  Future<Map<String, dynamic>> postOne(
      String tabela, Map<String, String> body) async {
    return returnOne(tabela);
  }

  @override
  Future<Map<String, dynamic>> putOne(
      String tabela, String id, Map<String, String> body) async {
    return returnOne(tabela);
  }

  @override
  Future<List<Map<String, dynamic>>> postData(
      String tabela, Map<String, String> body) async {
    return returnList(tabela);
  }

  Map<String, dynamic> returnOne(String fileName) {
    final result = json.decode('''{
    "id": "1",
    "numeroPatrimonio": "123456",
    "descricao": "Computador",
    "idCompra": "1",
    "marca": { "id": "1", "nome": "Dell" },
    "modelo": "Inspiron",
    "tipo": 1,
    "status": 1,
    "local": { "id": "1", "nome": "Sala 01", "andar": "1" },
    "observacao": "Sem observação",
    "dataCadastro": "2022-01-01T00:00:00.000Z",
    "dataAtualizacao": "2022-01-01T00:00:00.000Z",
    "idUsuarioAtualizacao": "1"
  }''');
    return Map<String, dynamic>.from(result);
  }

  List<Map<String, dynamic>> returnList(String fileName) {
    final result = json.decode('''[{
    "id": "1",
    "numeroPatrimonio": "123456",
    "descricao": "Computador",
    "idCompra": "1",
    "marca": { "id": "1", "nome": "Dell" },
    "modelo": "Inspiron",
    "tipo": 1,
    "status": 1,
    "local": { "id": "1", "nome": "Sala 01", "andar": "1" },
    "observacao": "Sem observação",
    "dataCadastro": "2022-01-01T00:00:00.000Z",
    "dataAtualizacao": "2022-01-01T00:00:00.000Z",
    "idUsuarioAtualizacao": "1"
  }]''');
    return List<Map<String, dynamic>>.from(result);
  }
}
