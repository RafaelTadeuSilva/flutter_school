import 'dart:convert';

import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/features/patrimonio/repositories/patrimonio_repository.dart';
import 'package:flutter_school/src/shared/either.dart';
import 'package:flutter_school/src/util/files/file_reader_writer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'patrimonio_list_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PatrimonioRepository>()])
void main() {
  group('Patrimonio Controller', () {
    final repository = MockPatrimonioRepository();
    late final PatrimonioController control;
    late final List mapPatrimonios;
    late final List<Patrimonio> listPatrimonios;

    setUpAll(() async {
      control = PatrimonioController(repository);
      mapPatrimonios =
          json.decode(await readFile('test_resources/patrimonio.json'));
      listPatrimonios =
          mapPatrimonios.map((e) => Patrimonio.fromJson(e)).toList();
    });
    test('getPatrimonio', () async {
      when(repository.getPatrimonio(any))
          .thenAnswer((_) async => Success(listPatrimonios.first));
      await control.getPatrimonio('1');
      expect(control.patrimonioAtual()!.id, equals('1'));
    });

    test('getPatrimonio Failure', () async {
      when(repository.getPatrimonio(any))
          .thenAnswer((_) async => Failure(Exception()));
      await control.getPatrimonio('');
      expect(control.patrimonioAtual(), null);
    });
  });
}
