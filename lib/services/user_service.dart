import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String url = "http://192.168.100.13:8080/";
  static const String nada = "";
  static const String login = "login/";
  static const String renda = "renda/";
  static const String registrar = "registrar/";
  static const String registrarR = "registrar_renda/";

  String getUrl(String recourse) {
    return "$url$recourse";
  }

  register(String nome, String email, String senha, String renda) async {
    var arquivo_json ='{\r\n    "username": "$nome",\r\n    "email": "$email",\r\n    "password": "$senha"\r\n}';
    var response = await http.post(Uri.parse(getUrl(registrar)),body: arquivo_json);
    
    return true;
  }

  Future<String> get() async {
    http.Response response = await http.get(Uri.parse(getUrl(nada)));

    return response.body;
  }
  
  Logar(String nome, String senha) async {
    var arquivo_json ='{\r\n    "username": "$nome",\r\n    "password": "$senha"\r\n}';
    var response = await http.post(Uri.parse(getUrl(login)),body: arquivo_json);
    saveUser(response.body).then((id){
      if (id == 0) {
        throw HttpException(response.body);
        }
      });
    return true;
  }

  Logout(context){
    SharedPreferences.getInstance().then((prefs){
      prefs.clear();
      Navigator.pushReplacementNamed(context, "login");
    });
  }

  Future<double?>PegarRenda(int? id) async{
    var arquivo_json ='{\r\n    "id" : $id\r\n}';
    var response = await http.post(Uri.parse(getUrl(renda)),body: arquivo_json);
     
    return saveUserInfo(response.body);
  }

  Future<int?> pegarId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt("id");
    return id;
  }

  registrar_renda(double? renda_mensal, int? id) async{
    var arquivo_json ='{\r\n    "renda_mensal": "$renda_mensal",\r\n    "id": "$id"\r\n}';
    var response = await http.post(Uri.parse(getUrl(registrarR)),body: arquivo_json);
    
    return true;
  }
}


saveUser(String body) async {
        Map<String, dynamic> map = json.decode(body);

        String token = map["token"];
        String username= map["username"];
        int id = map["id"];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", token);
        prefs.setString("username", username);
        prefs.setInt("id", id);

        int? Id = prefs.getInt("id");
        return Id;
}

Future<double?>saveUserInfo(String body) async {
    Map<String, dynamic> map = json.decode(body);
    double renda = map["renda_mensal"];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("renda_mensal", renda);

    double? Renda = prefs.getDouble("renda_mensal");
    return Renda;
}

