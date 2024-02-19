import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/features/patrimonio/repositories/patrimonio_repository.dart';
import 'package:flutter_school/src/shared/either.dart';
import 'package:signals/signals.dart';

class PatrimonioController {
  final PatrimonioRepository repository;

  final patrimonioAtual = signal<Patrimonio?>(null);
  final id = signal<String?>(null);
  final numeroPatrimonio = signal<String>('');
  final descricao = signal<String>('');

  PatrimonioController(this.repository);

  Future<Patrimonio?> findOne(String id) async {
    final response = await repository.getPatrimonio(id);
    return switch (response) {
      Success() => response.value,
      _ => null,
    };
  }
}
