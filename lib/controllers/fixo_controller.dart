import 'package:flutter/material.dart';
import 'package:mogen/models/fixo_models.dart';
import 'package:mogen/repositories/fixo_repository.dart';

class FixoController {
  
  List<FixoModel> fixos = [];
  final repository = FixoRepository();
  final state = ValueNotifier<FixoState>(FixoState.start);

  Future start(int? id) async {
    state.value = FixoState.loading;
    try {
      print('pegando os dados');
      fixos = await repository.fetchFixos(id);
      state.value = FixoState.success;
      print('peguei os dados');
    } catch(e) {
      print('nâo peguei os dados');
      state.value = FixoState.error;
    } 
  }
}

enum FixoState {start, loading, success, error}