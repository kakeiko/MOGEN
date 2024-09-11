import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/controllers/temporario_controller.dart';
import 'package:mogen/screens/tela-add-temporario.dart';
import 'package:mogen/screens/tela-edit-temporario.dart';


class Temporarios extends StatefulWidget {
  final int? id;
const Temporarios({ Key? key, required this.id }) : super(key: key);

  @override
  State<Temporarios> createState() => _TemporariosState();
}

class _TemporariosState extends State<Temporarios> {
  final controller = TemporarioController();

  _success() {
    return ListView(
      shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [Column(
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
                  'Gastos temporários',
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
                  itemCount: controller.temporarios.length,
                  itemBuilder: (context, index) {
                    var temporario = controller.temporarios[index];

                    String? nome = temporario.nome;
                    String? categoria = temporario.categoria;
                    String? valor = temporario.valor;
                    String? pagamento= temporario.pagamento;
                    String? banco = temporario.banco ;
                    String? diaInicial = temporario.diaInicial;
                    String? diaFinal = temporario.diaFinal;
                    
                    int? id2 = temporario.id;

                      return TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEditTemporario(id: widget.id, nome: nome, categoria: categoria, valor: valor, pagamento: pagamento, banco: banco, diaInicial: diaInicial, diaFinal: diaFinal, id2: id2,),),);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: 
                                    Image.asset(
                                      'assets/imagens/visu.png',
                                      width: 40,
                                    ),
                              ),            
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                      child: 
                                      Text(
                                        '$nome',
                                        style: GoogleFonts.secularOne(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(192, 187, 157, 1)
                                          ),
                                        ),
                                      ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                        child: 
                                          Text(
                                            '$diaInicial até $diaFinal',
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
                                    text: 'R\$',
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
                                  ),
                                ),
                                  )
                              ],
                            )
                          ],
                          ),
                      );
                  }
                ),          

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
                  itemBuilder: (context, index) {
                    int total = 0;
                    for (var valor in controller.temporarios) {
                      total -= int.parse(valor.valor.toString());
                    }
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
                                  text: 'R\$',
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
            ),
                  
                const SizedBox(
                      height: 40,
                    ),

                ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaAddTemporario(id: widget.id,),),);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                        backgroundColor: Color.fromRGBO(50, 73, 55, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                      ),
                      child: Text(
                      'Criar',
                      style: GoogleFonts.secularOne(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              ],
              ),
            ]
          );
  }

   _error () {
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

  _start () {
    return Container();
  }

  stateManagement (TemporarioState state) {
    switch (state) {

      case TemporarioState.start :
        return _start(); 

      case TemporarioState.loading :
        return _loading(); 

      case TemporarioState.success :
        return _success(); 

      case TemporarioState.error :
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