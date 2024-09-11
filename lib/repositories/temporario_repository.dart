import 'package:dio/dio.dart';
import 'package:mogen/models/temporario_models.dart';


class TemporarioRepository {
  final dio = Dio();
  final url = 'http://192.168.100.13:8080/pegar_temporario/';

  Future<List<TemporarioModel>> fetchTemporarios(int? id) async {
    final response = await dio.post(url, data: { 'id': id });
    final list = response.data as List;
    
    List<TemporarioModel> temporarios = [];
    for (var json in list) {
      final temporario = TemporarioModel.fromJson(json);
      temporarios.add(temporario);
    }

    return temporarios;
  }
}