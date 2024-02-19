import 'package:flutter_school/export.dart';
import 'package:signals/signals.dart';

import '../repositories/marca_repository.dart';

class MarcaController {
  final listMarcas = signal<List<Marca>>([]);
  final MarcaRepository marcaRepository;

  MarcaController(this.marcaRepository);

  Future<void> getMarcas() async {
    final result = await marcaRepository.listMarcas();
    result.fold((l) => listMarcas.set([]), (r) => listMarcas.set(r));
  }
}
