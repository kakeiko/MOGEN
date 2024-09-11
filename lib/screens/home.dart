import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/components/comuns_sections/header.dart';
import 'package:mogen/components/tela_home_sections/acoes_add.dart';
import 'package:mogen/components/tela_home_sections/dinheiro_gastar.dart';
import 'package:mogen/components/tela_home_sections/prox_gastos.dart';
import 'package:mogen/controllers/extrato_controller.dart';
import 'package:mogen/controllers/fixo_controller.dart';
import 'package:mogen/controllers/temporario_controller.dart';
import 'package:mogen/screens/configuracao.dart';
import 'package:mogen/screens/extrato.dart';
import 'package:mogen/screens/gastos-fixo.dart';
import 'package:mogen/screens/tela-add-ganhos.dart';
import 'package:mogen/screens/tela-add-gastos.dart';
import 'package:mogen/screens/temporarios.dart';

class Home extends StatefulWidget {
final double? renda;
final int? id;
final List<dynamic>? lista;
const Home({ Key? key, required this.renda, required this.id, required this.lista }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controllerE = ExtratoController();
  final controllerF = FixoController();
  final controllerT = TemporarioController();


  _success() {
      return ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, index) {
              double money = (widget.renda)!;
              for (var item in controllerE.extratos) {
                if (item.ganhoGasto == 0) {
                  money = money - double.parse((item.valor)!);
                  }
                else {
                  money = money + double.parse((item.valor)!);
                }
              }
              for (var item in controllerF.fixos) {
                  money = money - double.parse((item.valor)!);
              }
              for (var item in controllerT.temporarios) {
                  money = money - double.parse((item.valor)!);
              }
            return Column(
              children: [
                Header(),
                DinheiroGastar(renda: money),
                AcoesAdd(id: widget.id, lista: widget.lista,),
              ],
            );}
          )
          
        ],
      );
    }

  _error() {
    return Center(
      child: ElevatedButton(
        child: 
          Text('Tente novamente'),
        onPressed: (){
          
        },
        ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(ExtratoState state){
    switch (state) {

      case ExtratoState.start :
        return _start(); 

      case ExtratoState.loading :
      print('to carregando');
        return _loading(); 

      case ExtratoState.success :
        return _success(); 

      case ExtratoState.error :
        return _error(); 


      default:
      return _start();

    }
  }

  @override
  void initState(){

    super.initState();

    controllerE.start(widget.id);
    controllerF.start(widget.id);
    controllerT.start(widget.id);
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 42, 32, 1),
      body: AnimatedBuilder(
        animation: controllerE.state,
        builder: (context, child) {
          return stateManagement(controllerE.state.value);
        },
        ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 100, 0, 0),
                    child: 
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaAddGastos(id: widget.id,),),);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/imagens/add--menu.png',
                            width: 40,
                            ),
                          const SizedBox(width: 10,),
                          Text(
                            'Adicionar gastos',
                            style: GoogleFonts.secularOne(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(192, 187, 157, 1)
                           ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 16, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaAddGanhos(id: widget.id,),),);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/imagens/add-+-menu.png',
                            width: 40,
                            ),
                          const SizedBox(width: 10,),
                          Text(
                            'Adicionar ganhos',
                            style: GoogleFonts.secularOne(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(192, 187, 157, 1)
                           ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 16, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Extrato(id: widget.id, lista: widget.lista,),),);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/imagens/dinheiro-menu.png',
                            width: 40,
                            ),
                          const SizedBox(width: 10,),
                          Text(
                            'Visualizar extrato',
                            style: GoogleFonts.secularOne(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(192, 187, 157, 1)
                           ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 16, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GastosFixo(id: widget.id,),),);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/imagens/fixo-menu.png',
                            width: 40,
                            ),
                          const SizedBox(width: 10,),
                          Text(
                            'Gerenciar gastos fixos',
                            style: GoogleFonts.secularOne(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(192, 187, 157, 1)
                           ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 16, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Temporarios(id: widget.id,),),);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/imagens/tempo-menu.png',
                            width: 40,
                            ),
                          const SizedBox(width: 10,),
                          Text(
                            'Gerenciar gastos temporários',
                            style: GoogleFonts.secularOne(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(192, 187, 157, 1)
                           ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 16, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Configuracao(),),);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/imagens/config-menu.png',
                            width: 40,
                            ),
                          const SizedBox(width: 10,),
                          Text(
                            'Configuração',
                            style: GoogleFonts.secularOne(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(192, 187, 157, 1)
                           ),
                            ),
                        ],
                      ),
                    ),
                  ),    
                  Padding(
                    padding: const EdgeInsets.fromLTRB(180, 80, 13, 26),
                    child: TextButton(
                      
                      onPressed: () { 
                        service.Logout(context);
                       },
                      child: Text(
                        'Logout',
                        style: GoogleFonts.secularOne(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(192, 187, 157, 1)
                           ),
                        ),
                    ),
                    ),
                ],
              ),
            )
          ],
        ),
      ), 
    );
  }
}