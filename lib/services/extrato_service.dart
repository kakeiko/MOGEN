import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExtratoService {
  static const String url = "http://192.168.100.13:8080/";
  static const String pegar_extrato = "pegar_extrato/";
  static const String registrar_extrato = "registrar_extrato/";

  String getUrl(String recourse) {  
    return "$url$recourse";
  }

  PegarExtrato(int? id) async{
    var arquivo_json ='{\r\n    "id" : $id\r\n}';
    var response = await http.post(Uri.parse(getUrl(pegar_extrato)),body: arquivo_json);
    List<dynamic>lista = await saveExtrato(response.body);
    return lista;
  }
}

saveExtrato(String body) async {
  // Map<String, dynamic> map = json.decode(body);
  List<dynamic> list = json.decode(body);
  // String nome = list.["nome"];
  // double valor = double.parse(map["valor"]);
  // String dia = map["dia"];
  // int ganho_gasto = map["ganho_gasto"];
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setString("nome", nome);
  // prefs.setDouble("valor", valor);
  // prefs.setString("dia", dia);
  // prefs.setInt("ganho_gasto", ganho_gasto);

  // String? Nome = prefs.getString("nome");
  // double? Valor = prefs.getDouble("valor");
  // String? Dia = prefs.getString("dia");
  // int? Ganho_gastos = prefs.getInt("ganho_gasto");  
  
  // print(Nome);
  // print(Valor);
  // print(Dia);
  // print(Ganho_gastos);
  return list;
}