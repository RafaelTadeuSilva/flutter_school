import 'dart:convert';

import 'package:flutter_school/src/shared/api_client/api_client.dart';
import 'package:http/http.dart' as http;

class HttpApiClient implements ApiClient {
  static const String baseUrl = "http://localhost:4000";
  final client = http.Client();

  @override
  Future<bool> deleteOne(String tabela, String id) async {
    final response = await client.delete(Uri.parse('$baseUrl/$tabela/$id'));
    return response.statusCode == 200;
  }

  @override
  Future<List<Map<String, dynamic>>> getData(
      String tabela, String params) async {
    final response = await client.get(Uri.parse(baseUrl + params));
    return returnList(response);
  }

  @override
  Future<Map<String, dynamic>> getOne(String tabela, String id) async {
    final response = await client.get(Uri.parse('$baseUrl/$tabela/$id'));
    return returnOne(response);
  }

  @override
  Future<Map<String, dynamic>> postOne(
      String tabela, Map<String, String> body) async {
    final response = await client.post(Uri.parse('$baseUrl/$tabela'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));

    return returnOne(response);
  }

  @override
  Future<Map<String, dynamic>> putOne(
      String tabela, String id, Map<String, String> body) async {
    final response = await client.put(Uri.parse('$baseUrl/$tabela/$id'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));

    return returnOne(response);
  }

  @override
  Future<List<Map<String, dynamic>>> postData(
      String tabela, Map<String, String> body) async {
    final response = await client.post(Uri.parse('$baseUrl/$tabela'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));
    return returnList(response);
  }

  Map<String, dynamic> returnOne(http.Response response) {
    return switch (response.statusCode) {
      200 => json.decode(response.body),
      _ => {},
    };
  }

  List<Map<String, dynamic>> returnList(http.Response response) {
    return switch (response.statusCode) {
      200 => List<Map<String, dynamic>>.from(json.decode(response.body)),
      _ => [],
    };
  }
}
