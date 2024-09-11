import 'package:http/http.dart' as http;

class GanhosService {
  static const String url = "http://192.168.100.13:8080/";
  static const String registrar = "registrar_ganho/";

  String getUrl(String recourse) {
    return "$url$recourse";
  }
  register(String nome,dynamic categoria, String valor, String banco, int? id) async {
    var arquivo_json ='{\r\n    "nome": "$nome",\r\n    "categoria": "$categoria",\r\n    "valor": "$valor",\r\n    "banco": "$banco",\r\n    "id": "$id"\r\n}';
    var response = await http.post(Uri.parse(getUrl(registrar)),body: arquivo_json);

    return true;
  }
}