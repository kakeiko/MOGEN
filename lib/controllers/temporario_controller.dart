import 'package:flutter/material.dart';
import 'package:mogen/models/temporario_models.dart';
import 'package:mogen/repositories/temporario_repository.dart';


class TemporarioController {
  
  List<TemporarioModel> temporarios = [];
  final repository = TemporarioRepository();
  final state = ValueNotifier<TemporarioState>(TemporarioState.start);

  Future start(int? id) async {
    state.value = TemporarioState.loading;
    try {
      print('pegando os dados');
      temporarios = await repository.fetchTemporarios(id);
      state.value = TemporarioState.success;
      print('peguei os dados');
    } catch(e) {
      print('nâo peguei os dados');
      state.value = TemporarioState.error;
    } 
  }
}

enum TemporarioState {start, loading, success, error}