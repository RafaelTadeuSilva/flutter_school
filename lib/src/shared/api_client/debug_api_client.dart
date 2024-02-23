import 'dart:convert';

import 'package:flutter_school/src/shared/api_client/api_client.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_school/src/util/files/file_reader_writer.dart';

class DebugApiClient implements ApiClient {
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
  Future<Map<String, dynamic>> getOne(String tabela, String id) async {
    return returnOne(tabela, id);
  }

  @override
  Future<Map<String, dynamic>> postOne(
      String tabela, Map<String, String> body) async {
    return returnOne(tabela, '1');
  }

  @override
  Future<Map<String, dynamic>> putOne(
      String tabela, String id, Map<String, String> body) async {
    return returnOne(tabela, id);
  }

  @override
  Future<List<Map<String, dynamic>>> postData(
      String tabela, Map<String, String> body) async {
    return returnList(tabela);
  }

  Future<Map<String, dynamic>> returnOne(String fileName, String id) async {
    String data = await readFile('test_resources/$fileName.json');
    return Map<String, dynamic>.from(
        json.decode(data).firstWhere((element) => element['id'] == id));
  }

  Future<List<Map<String, dynamic>>> returnList(String fileName) async {
    String data = await readFile('test_resources/$fileName.json');
    return List<Map<String, dynamic>>.from(json.decode(data));
  }
}
