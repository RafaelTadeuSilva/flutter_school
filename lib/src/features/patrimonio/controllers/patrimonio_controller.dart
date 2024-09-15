import 'package:flutter/material.dart';
import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/features/patrimonio/repositories/patrimonio_repository.dart';
import 'package:signals/signals.dart';

class PatrimonioController {
  final PatrimonioRepository repository;

  final patrimonioAtual = signal<Patrimonio?>(null);
  final state = signal<CadastroState>
  PatrimonioController(this.repository);

  Future<void> getPatrimonio(String id) async {
    final response = await repository.getPatrimonio(id);
    response.fold(
      (l) => showError(),
      (r) {
        loadPatrimonio(r);
      },
    );
  }

  void loadPatrimonio(Patrimonio patrimonio) {
    patrimonioAtual.value = patrimonio;
  }

  void setNumeroPatrimonio(String value) {
    patrimonioAtual.value =
        patrimonioAtual.value!.copyWith(numeroPatrimonio: value);
  }

  void setDescricao(String value) {
    patrimonioAtual.value = patrimonioAtual.value!.copyWith(descricao: value);
  }
  
  void showError() {
    
  }
}
