import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/features/patrimonio/repositories/patrimonio_repository.dart';
import 'package:flutter_school/src/mixins/load_mixin.dart';
import 'package:flutter_school/src/mixins/message_mixin.dart';
import 'package:signals/signals.dart';

class PatrimonioListController with LoadMixin, MessageMixin {
  final PatrimonioRepository repository;

  final listPatrimonios = signal(<Patrimonio>[]);

  PatrimonioListController(this.repository);

  Future<void> getPatrimonios() async {
    startLoading();
    final list = await repository.listPatrimonios();
    list.fold(onError, onSuccess);
    stopLoading();
  }

  void onError(Exception failure) {
    listPatrimonios.set([]);
    showError(failure);
  }

  void onSuccess(List<Patrimonio> success) {
    listPatrimonios.set(success);
  }
}
