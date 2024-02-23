import 'dart:convert';

import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/features/patrimonio/controllers/patrimonio_list_controller.dart';
import 'package:flutter_school/src/features/patrimonio/repositories/patrimonio_repository.dart';
import 'package:flutter_school/src/shared/either.dart';
import 'package:flutter_school/src/util/files/file_reader_writer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'patrimonio_list_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PatrimonioRepository>()])
void main() {
  group('Patrimonio Controller Tests', () {
    late PatrimonioListController control;
    final repository = MockPatrimonioRepository();
    late final List mapPatrimonios;
    late final List<Patrimonio> listPatrimonios;

    setUpAll(() async {
      control = PatrimonioListController(repository);
      mapPatrimonios =
          json.decode(await readFile('test_resources/patrimonio.json'));
      listPatrimonios =
          mapPatrimonios.map((e) => Patrimonio.fromJson(e)).toList();
    });

    test('getAllPatrimonios Empty List', () async {
      when(repository.listPatrimonios()).thenAnswer((_) async => Success([]));
      await control.getPatrimonios();
      expect(control.listPatrimonios.value.length, 0);
    });

    test('getAllPatrimonios 5 itens', () async {
      when(repository.listPatrimonios())
          .thenAnswer((_) async => Success(listPatrimonios));
      await control.getPatrimonios();
      expect(control.listPatrimonios.value.length, 5);
    });

    test('getAllPatrimonios Failure', () async {
      when(repository.listPatrimonios())
          .thenAnswer((_) async => Failure(Exception()));
      await control.getPatrimonios();
      expect(control.listPatrimonios.value.length, 0);
    });
  });
}
