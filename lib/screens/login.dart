import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/screens/cadastrar.dart';
import 'package:mogen/screens/home.dart';
import 'package:mogen/screens/registrar_renda.dart';
import 'package:mogen/services/extrato_service.dart';
import 'package:mogen/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 42, 32, 1),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                        controller: _nomeController,
                        decoration: InputDecoration(                      
                          labelText: 'Nome:',
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
                height: 15,
              ),
        
              Form(child:
                Padding(
                  padding: EdgeInsets.fromLTRB(63, 0, 63, 0),
                  child: 
                  Column(
                    children: [
                      TextFormField(
                        controller: _senhaController,
                        decoration: InputDecoration(                      
                          labelText: 'Senha:',
        
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
                        obscureText: true,
                      ),
                    ],
                  )
                ),
              ),
            
              const SizedBox(
                height: 100,
              ),
        
              ElevatedButton(
                onPressed: (){
                  UserService service = UserService();
                  service.Logar(_nomeController.text, _senhaController.text).then((resultLogin){
                    if(resultLogin == true) {
                      print(resultLogin);
                      
                      service.pegarId().then((id){
                        service.PegarRenda(id).then((renda){
                          if (renda == -1.0) {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrarRenda(id: id,),),);
                          }
                          else{
                            List<dynamic>? lista;
                            ExtratoService service1 = ExtratoService();
                            service1.PegarExtrato(id).then((lista){
                              Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home(renda: renda, id: id, lista: lista,),),);
                            }); 
                            
                          }
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
                'Entrar',
                style: GoogleFonts.secularOne(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(192, 187, 157, 1)
                    ),
                ),
              ),
            
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Cadastrar(),),);
                },
                child: Text(
                'Quero me cadastrar!',
                style: GoogleFonts.secularOne(
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(192, 187, 157, 1),
                  ),
        
                ),
              ),
            ],
          ),
        ),]
      ),
    );
  }
}