import 'package:dio/dio.dart';
import 'package:mogen/models/fixo_models.dart';


class FixoRepository {
  final dio = Dio();
  final url = 'http://192.168.100.13:8080/pegar_fixo/';

  Future<List<FixoModel>> fetchFixos(int? id) async {
    final response = await dio.post(url, data: { 'id': id });
    final list = response.data as List;
    
    List<FixoModel> fixos = [];
    for (var json in list) {
      final fixo = FixoModel.fromJson(json);
      fixos.add(fixo);
    }

    return fixos;
  }
}