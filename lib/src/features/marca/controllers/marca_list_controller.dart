import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/features/marca/repositories/marca_repository.dart';
import 'package:flutter_school/src/mixins/load_mixin.dart';
import 'package:signals/signals.dart';

class MarcaListController with LoadMixin {
  final MarcaRepository repository;

  final listMarcas = signal(<Marca>[]);

  MarcaListController(this.repository);

  Future<void> getMarcas() async {
    startLoading();
    await Future.delayed(Duration(seconds: 1));
    final list = await repository.listMarcas();
    list.fold(onError, onSuccess);
    stopLoading();
  }

  void onError(Exception failure) {
    listMarcas.set([]);
  }

  void onSuccess(List<Marca> success) {
    listMarcas.set(success);
  }
}
