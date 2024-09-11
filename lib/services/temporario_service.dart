import 'package:http/http.dart' as http;

class TemporarioService {
  static const String url = "http://192.168.100.13:8080/";
  static const String pegar_temporario = "pegar_temporario/";
  static const String registrar = "registrar_temporario/";
  static const String editar = "editar_temporario/";
  static const String deletar = "deletar_temporario/";
  

  String getUrl(String recourse) {  
    return "$url$recourse";
  }

  register(String nome,dynamic categoria, String valor,dynamic pagamento, String banco,String dia_inicial,String dia_final, int? id) async {
    var arquivo_json ='{\r\n    "nome": "$nome",\r\n    "categoria": "$categoria",\r\n    "valor": "$valor",\r\n    "pagamento": "$pagamento",\r\n    "banco": "$banco",\r\n    "dia_inicial": "$dia_inicial",\r\n    "dia_final": "$dia_final",\r\n    "dono": "$id"\r\n}';
    var response = await http.post(Uri.parse(getUrl(registrar)),body: arquivo_json);

    return true;
  }
  editer(String nome,dynamic categoria, String valor,dynamic pagamento, String banco,String dia_inicial,String dia_final, int? id) async {
    var arquivo_json ='{\r\n    "nome": "$nome",\r\n    "categoria": "$categoria",\r\n    "valor": "$valor",\r\n    "pagamento": "$pagamento",\r\n    "banco": "$banco",\r\n    "dia_inicial": "$dia_inicial",\r\n    "dia_final": "$dia_final",\r\n    "dono": "$id"\r\n}';
    var response = await http.put(Uri.parse(getUrl(editar)),body: arquivo_json);

    return true;
  }
  delete(int? id) async {
    var arquivo_json ='{\r\n    "dono": "$id"\r\n}';
    var response = await http.delete(Uri.parse(getUrl(deletar)),body: arquivo_json);

    return true;
  }
}