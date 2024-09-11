import 'package:flutter/material.dart';
import 'package:mogen/components/tela_home_sections/dinheiro_gastar.dart';
import 'package:mogen/screens/home.dart';
import 'package:mogen/screens/inicial.dart';
import 'package:mogen/screens/registrar_renda.dart';
import 'package:mogen/services/extrato_service.dart';
import 'package:mogen/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  bool isLogged = await verifyToken();
  double? renda;
  int? id;
  List<dynamic>? lista;
  if (isLogged) {
    UserService service = UserService();
    id = await pegarId();
    renda = await service.PegarRenda(id);
  }
  UserService service = UserService();
  ExtratoService service1 = ExtratoService();
  lista = await service1.PegarExtrato(id);
  service.get();
  runApp(Mogen(isLogged: isLogged, renda: renda, id: id, lista: lista,));
}

Future<int?> pegarId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? id = prefs.getInt("id");
  return id;
}
Future<bool> verifyToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  if (token != null) {
    return true;
  }
  return false;
}
class Mogen extends StatelessWidget {
  final bool isLogged;
  final double? renda;
  final int? id;
  final List<dynamic>? lista;
  const Mogen({ Key? key, required this.isLogged, required this.renda, required this.id, required this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Mogen',
      initialRoute: (isLogged) ? "home" : "login",
      routes: {
        "home": (context) => Home(renda: renda, id: id,lista: lista,),
        "login": (context) => Inicial(),
      },
    );
  }
}