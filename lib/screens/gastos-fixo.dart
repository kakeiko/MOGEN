import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/controllers/fixo_controller.dart';
import 'package:mogen/screens/tela-add-fixo.dart';
import 'package:mogen/screens/tela-edit-fixo.dart';

class GastosFixo extends StatefulWidget {
  final int? id;
const GastosFixo({ Key? key, required this.id }) : super(key: key);

  @override
  State<GastosFixo> createState() => _GastosFixoState();
}

class _GastosFixoState extends State<GastosFixo> {
  final controller = FixoController();

  _success () {
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
                  'Gastos fixo',
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
                  itemCount: controller.fixos.length,
                  itemBuilder: (context, index) {
                    var fixo = controller.fixos[index];

                    String? nome = fixo.nome;
                    String? categoria = fixo.categoria;
                    String? valor = fixo.valor;
                    String? pagamento= fixo.pagamento;
                    String? banco = fixo.banco ;
                    String? dia = fixo.diaPagamento;
                    
                    int? id2 = fixo.id;

                    return TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEditFixo(id: widget.id, nome: nome, categoria: categoria, valor: valor, pagamento: pagamento, banco: banco, dia: dia, id2: id2,),),);
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
                                  padding: EdgeInsets.fromLTRB(0, 15, 75, 0),
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
                                    padding: EdgeInsets.fromLTRB(0, 0, 75, 0),
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
                              padding: EdgeInsets.fromLTRB(10, 0, 55, 0),
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
                
                  },

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
                    for (var valor in controller.fixos) {
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaAddFixo(id: widget.id,),),);
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

  stateManagement (FixoState state) {
    switch (state) {

      case FixoState.start :
        return _start(); 

      case FixoState.loading :
        return _loading(); 

      case FixoState.success :
        return _success(); 

      case FixoState.error :
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