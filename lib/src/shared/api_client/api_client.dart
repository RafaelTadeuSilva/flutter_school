abstract interface class ApiClient {
  Future<Map<String, dynamic>> getOne(String tabela, String id);
  Future<List<Map<String, dynamic>>> getData(String tabela, String params);
  Future<List<Map<String, dynamic>>> postData(
      String tabela, Map<String, String> body);
  Future<Map<String, dynamic>> postOne(String tabela, Map<String, String> body);
  Future<Map<String, dynamic>> putOne(
      String tabela, String id, Map<String, String> body);
  Future<bool> deleteOne(String tabela, String id);
}
