import 'package:flutter/material.dart';
import 'package:mogen/models/extrato_models.dart';
import 'package:mogen/repositories/extrato_repository.dart';

class ExtratoController {
  
  List<ExtratoModel> extratos = [];
  final repository = ExtratoRepository();
  final state = ValueNotifier<ExtratoState>(ExtratoState.start);

  Future start(int? id) async {
    state.value = ExtratoState.loading;
    try {
      print('pegando os dados');
      extratos = await repository.fetchExtratos(id);
      state.value = ExtratoState.success;
      print('peguei os dados');
    } catch(e) {
      print('nâo peguei os dados');
      state.value = ExtratoState.error;
    } 
  }
}

enum ExtratoState {start, loading, success, error}