import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/controllers/extrato_controller.dart';


class Extrato extends StatefulWidget {
  final int? id;
  final List<dynamic>? lista;
 Extrato({ Key? key, required this.id, required this.lista }) : super(key: key);

  @override
  State<Extrato> createState() => _ExtratoState();
}

class _ExtratoState extends State<Extrato> {
  final controller = ExtratoController();
  
  
  _success() {
    return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromRGBO(192, 187, 157, 1),)
                ),
                ]
            ),
            
            const SizedBox(
              height: 10,
            ),
        
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Extrato',
                  style: GoogleFonts.secularOne(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(192, 187, 157, 1)
                      ),
                  ),
        
                const SizedBox(
                  height: 40,
                ),
        
                Image.asset(
                  'assets/imagens/linha.png',
                ),
        
                const SizedBox(
                  height: 50,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.extratos.length,
                  itemBuilder: (context, index){
                    var extrato = controller.extratos[index];
                    if (extrato.ganhoGasto == 0) {
                      String? nome = extrato.nome;
                      String? dia = extrato.dia;
                      String? valor = extrato.valor;
                      return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Image.asset(
                                 'assets/imagens/visu.png',
                                  width: 40,),
                                ),
                              Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 15, 75, 0),
                                      child: 
                                        Text(
                                          "$nome",
                                          style: GoogleFonts.secularOne(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(192, 187, 157, 1)
                                          ),
                                        ),
                                    ),
                                    Padding(
                                   padding: EdgeInsets.fromLTRB(10, 0, 55, 0),
                                   child: 
                                     Text(
                                       '$dia',
                                       style: GoogleFonts.secularOne(
                                         fontSize: 16,
                                         fontWeight: FontWeight.w400,
                                         color: const Color.fromRGBO(192, 187, 157, 1)
                                        ),
                                     ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                                child: Text.rich(TextSpan(
                                  text: '-R\$',
                                  style: GoogleFonts.secularOne(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(192, 187, 157, 1)
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '$valor,00'
                                  )
                                ]
                              )),
                             )
                            ],
                          ),
                        ],
                      );
                    }
                    else {
                      String? nome = extrato.nome;
                      String? dia = extrato.dia;
                      String? valor = extrato.valor;
                      
                      return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Image.asset(
                                 'assets/imagens/visu.png',
                                  width: 40,),
                                ),
                              Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 15, 75, 0),
                                      child: 
                                        Text(
                                          "$nome",
                                          style: GoogleFonts.secularOne(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(192, 187, 157, 1)
                                          ),
                                        ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 55, 0),
                                   child: 
                                     Text(
                                       '$dia',
                                       style: GoogleFonts.secularOne(
                                         fontSize: 16,
                                         fontWeight: FontWeight.w400,
                                         color: const Color.fromRGBO(192, 187, 157, 1)
                                        ),
                                     ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                                child: Text.rich(TextSpan(
                                  text: '+R\$',
                                  style: GoogleFonts.secularOne(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(192, 187, 157, 1)
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '$valor,00'
                                  )
                                ]
                              )),
                             )
                            ],
                          ),
                        ],
                      );
                    }
                }),

                const SizedBox(
                  height: 50,
                ),

                Image.asset(
                  'assets/imagens/linha.png',
                ),

                const SizedBox(
                  height: 40,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context, index){
                    int total = 0;
                    for (var valor in controller.extratos) {
                      if (valor.ganhoGasto == 0){
                        total -= int.parse(valor.valor.toString());
                      }
                      else {
                        total += int.parse(valor.valor.toString());
                      }
                    }
                    if (total >= 0) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total:',
                            style: GoogleFonts.secularOne(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(192, 187, 157, 1)
                                ),
                            ),
                          Padding(
                                padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                                child: Text.rich(TextSpan(
                                  text: '+R\$',
                                  style: GoogleFonts.secularOne(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(192, 187, 157, 1)
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                  text: '$total,00'
                                )
                              ]
                                ),
                              ),
                                ),   
                        ]
                      );
                    }
                    else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total:',
                            style: GoogleFonts.secularOne(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(192, 187, 157, 1)
                                ),
                            ),
                          Padding(
                                padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                                child: Text.rich(TextSpan(
                                  text: '-R\$',
                                  style: GoogleFonts.secularOne(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(192, 187, 157, 1)
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                  text: '$total,00'
                                )
                              ]
                                ),
                              ),
                                ),   
                        ]
                      );
                    }
                  }),
                
               ],
            ),
          ),
          ],
          ),
        ]
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

    controller.start(widget.id);
  }

  @override
  Widget build(BuildContext context){
    print(widget.lista);
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 42, 32, 1),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
        ),
    );
        
  }
}