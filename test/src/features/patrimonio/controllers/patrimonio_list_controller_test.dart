import 'package:flutter_school/src/features/patrimonio/controllers/patrimonio_list_controller.dart';
import 'package:flutter_school/src/features/patrimonio/repositories/patrimonio_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'patrimonio_list_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PatrimonioRepository>()])
void main() {
  group('Patrimonio Controller Tests', () {
    // final patrimonioJson =
    //     File('test_resources/patrimonio.json').readAsStringSync();
    late PatrimonioListController control;
    final repository = MockPatrimonioRepository();
    ();
    setUp(() {
      control = PatrimonioListController(repository);
    });

    test('getAllPatrimonios', () async {
      when(repository.listPatrimonios()).thenAnswer((_) async => []);
      await control.getAllPatrimonio();
      expect(control.listPatrimonio.value.length, 0);
    });
  });
}
