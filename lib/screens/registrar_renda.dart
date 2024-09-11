import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/screens/home.dart';
import 'package:mogen/services/extrato_service.dart';
import 'package:mogen/services/user_service.dart';

class RegistrarRenda extends StatefulWidget {
  
  final int? id;
  const RegistrarRenda({super.key, required this.id});
  @override
  
  
  State<RegistrarRenda> createState() => _RegistrarRendaState();
}

class _RegistrarRendaState extends State<RegistrarRenda> {
  final _rendaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 42, 32, 1),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'MOGEN',
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
                  height: 200,
                ),

                Form(child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 63, 0),
                    child: 
                    Column(
                      children: [
                        TextFormField(
                          controller: _rendaController,
                          decoration: InputDecoration(                      
                            labelText: 'Renda:',
                            labelStyle: GoogleFonts.secularOne(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                              ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(76, 100, 78, 1),
                                width: 0,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(76, 100, 78, 1),
                                width: 4,
                                ),
                              ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),

                const SizedBox(
                  height: 200,
                ),
          
                ElevatedButton(
                  onPressed: (){
                    UserService service = UserService();
                    service.registrar_renda(double.parse(_rendaController.text), widget.id).then((result){
                      if (result){
                        service.PegarRenda(widget.id).then((renda){
                          List<dynamic>? lista;
                            ExtratoService service1 = ExtratoService();
                            service1.PegarExtrato(widget.id).then((lista){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(renda: renda, id: widget.id, lista: lista,),),);
                            }); 
                        });
                      }
                    });
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
          )],
        ),
    );
  }
}