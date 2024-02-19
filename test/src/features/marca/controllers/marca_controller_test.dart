import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/features/marca/controllers/marca_controller.dart';
import 'package:flutter_school/src/features/marca/repositories/marca_repository.dart';
import 'package:flutter_school/src/shared/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'marca_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MarcaRepository>()])
void main() {
  late final MarcaController control;
  final repository = MockMarcaRepository();
  setUp(() {
    control = MarcaController(repository);
  });
  group('Marca Controller', () {
    test('marca controller ...', () async {
      when(repository.listMarcas()).thenAnswer((_) async => Success([
            {'id': '1', 'nome': 'Dell'},
            {'id': '2', 'nome': 'HP'},
            {'id': '3', 'nome': 'Acer'},
          ].map((e) => Marca.fromJson(e)).toList()));
      await control.getMarcas();
      expect(control.listMarcas.value.length, 3);
    });
  });
}
