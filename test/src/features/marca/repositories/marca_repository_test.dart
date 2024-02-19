import 'dart:math';

import 'package:flutter_school/src/features/marca/repositories/marca_repository.dart';
import 'package:flutter_school/src/models/marca_model.dart';
import 'package:flutter_school/src/shared/api_client/api_client.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'marca_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiClient>()])
void main() {
  group("Marca Repository", () {
    late MarcaRepository repository;
    MockApiClient client = MockApiClient();
    setUp(() {
      repository = MarcaRepository(client);
    });
    test('list Marcas', () async {
      when(client.getData('marca', '')).thenAnswer((_) async => [
            {'id': '1', 'nome': 'Dell'},
            {'id': '2', 'nome': 'HP'},
            {'id': '3', 'nome': 'Acer'},
          ]);
      final result = await repository.listMarcas();

      expect(result.isSuccess, true);
      expect(result.success, isA<List<Marca>>());
      expect(result.success.length, 3);
    });
    test('should throw', () async {
      when(client.getData('marca', '')).thenThrow(Exception());
      final result = await repository.listMarcas();

      expect(result.isFailure, true);
    });
  });
}
