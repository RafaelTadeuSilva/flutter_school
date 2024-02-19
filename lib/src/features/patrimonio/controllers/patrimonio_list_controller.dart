import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/features/patrimonio/repositories/patrimonio_repository.dart';
import 'package:flutter_school/src/shared/either.dart';
import 'package:signals/signals.dart';

class PatrimonioListController {
  final PatrimonioRepository repository;

  final listPatrimonio = signal(<Patrimonio>[]);

  PatrimonioListController(this.repository);

  Future<void> getAllPatrimonio() async {
    final list = await repository.listPatrimonios();
    listPatrimonio.value = switch (list) {
      Success() => list.value,
      _ => [],
    };
  }
}
