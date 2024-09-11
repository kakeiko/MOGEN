import 'package:http/http.dart' as http;

class FixoService {
  static const String url = "http://192.168.100.13:8080/";
  static const String pegar_fixo = "pegar_fixo/";
  static const String registrar = "registrar_fixo/";
  static const String editar = "editar_fixo/";
  static const String deletar = "deletar_fixo/";
  

  String getUrl(String recourse) {  
    return "$url$recourse";
  }

  register(String nome,dynamic categoria, String valor,dynamic pagamento, String banco,String dia_pagamento, int? id) async {
    var arquivo_json ='{\r\n    "nome": "$nome",\r\n    "categoria": "$categoria",\r\n    "valor": "$valor",\r\n    "pagamento": "$pagamento",\r\n    "banco": "$banco",\r\n    "dia_pagamento": "$dia_pagamento",\r\n    "dono": "$id"\r\n}';
    var response = await http.post(Uri.parse(getUrl(registrar)),body: arquivo_json);

    return true;
  }
  editer(String nome,dynamic categoria, String valor,dynamic pagamento, String banco,String dia_pagamento, int? id) async {
    var arquivo_json ='{\r\n    "nome": "$nome",\r\n    "categoria": "$categoria",\r\n    "valor": "$valor",\r\n    "pagamento": "$pagamento",\r\n    "banco": "$banco",\r\n    "dia_pagamento": "$dia_pagamento",\r\n    "dono": "$id"\r\n}';
    var response = await http.put(Uri.parse(getUrl(editar)),body: arquivo_json);

    return true;
  }
  delete(int? id) async {
    var arquivo_json ='{\r\n    "dono": "$id"\r\n}';
    var response = await http.delete(Uri.parse(getUrl(deletar)),body: arquivo_json);

    return true;
  }
}