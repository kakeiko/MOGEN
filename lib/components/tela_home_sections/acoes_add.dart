import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/components/comuns_sections/box_cart.dart';
import 'package:mogen/screens/configuracao.dart';
import 'package:mogen/screens/extrato.dart';
import 'package:mogen/screens/gastos-fixo.dart';
import 'package:mogen/screens/tela-add-ganhos.dart';
import 'package:mogen/screens/tela-add-gastos.dart';
import 'package:mogen/screens/temporarios.dart';
import 'package:mogen/services/extrato_service.dart';

class AcoesAdd extends StatelessWidget {
final int? id;
final List<dynamic>? lista;
const AcoesAdd({ Key? key, required this.id, required this.lista }) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(38, 0, 38, 51),
      child: 
      BoxCart(boxContent: _AcoesAddContent(id: id, lista:lista,)),
    );
  }
}

class _AcoesAddContent extends StatelessWidget {
final int? id;
final List<dynamic>? lista;
const _AcoesAddContent({ Key? key, required this.id, required this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: 
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaAddGastos(id: id,),),);
                  },
                  child: Column(children: <Widget>[
                    Image.asset(
                      'assets/imagens/add--.png',
                      width: 60,
                      ),
                    Text(
                      'Adicionar',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                    ),
                    Text(
                      'gastos',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                      ),
                  ],),
                ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: 
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaAddGanhos(id: id,),),);
                  },
                  child: Column(children: [
                    Image.asset(
                      'assets/imagens/add-+.png',
                      width: 60,
                      ),
                    Text(
                      'Adicionar',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                      ),
                    Text(
                      'ganhos',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                      ),
                  ],),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: 
                TextButton(
                  onPressed: () {
                    ExtratoService service = ExtratoService();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Extrato(id: id, lista: lista,),),);
                  },
                  child: Column(children: [
                    Image.asset(
                      'assets/imagens/visu.png',
                      width: 60,
                      ),
                    Text(
                      'Visualizar',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                      ),
                    Text(
                      'extrato',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                      ),
                  ],),
                ),
              ),
          ],
        ),
            ),
        Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: 
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GastosFixo(id: id,),),);
                  },
                  child: Column(children: <Widget>[
                    Image.asset(
                      'assets/imagens/fixo.png',
                      width: 60,
                      ),
                    Text(
                      'Gerenciar',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                    ),
                    Text(
                      'gastos fixos',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                      ),
                  ],),
                ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: 
                TextButton(
                 onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Temporarios(id: id,),),);
                  },
                  child: Column(children: [
                    Image.asset(
                      'assets/imagens/temp.png',
                      width: 60,
                      ),
                    Text(
                      'Gerenciar',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                      ),
                    Text(
                      'gastos temporários',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                      ),
                  ],),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: 
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Configuracao(),),);
                  },
                  child: Column(children: [
                    Image.asset(
                      'assets/imagens/conf.png',
                      width: 60,
                      ),
                    Text(
                      'Configuração',
                      style: GoogleFonts.secularOne(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                        ),
                      ),
                  
                  ],),
                ),
              ),
          ],
        ),
            ),
    ],);
  }
}