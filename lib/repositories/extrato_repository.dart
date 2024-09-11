import 'package:dio/dio.dart';
import 'package:mogen/models/extrato_models.dart';

class ExtratoRepository {
  final dio = Dio();
  final url = 'http://192.168.100.13:8080/pegar_extrato/';

  Future<List<ExtratoModel>> fetchExtratos(int? id) async {
    final response = await dio.post(url, data: { 'id': id });
    final list = response.data as List;
    
    List<ExtratoModel> extratos = [];
    for (var json in list) {
      final extrato = ExtratoModel.fromJson(json);
      extratos.add(extrato);
    }

    return extratos;
  }
}
