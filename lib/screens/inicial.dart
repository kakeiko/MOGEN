import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/screens/cadastrar.dart';
import 'package:mogen/screens/login.dart';

class Inicial extends StatelessWidget {
const Inicial({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 42, 32, 1),
      body:
        Center(
          child: 
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seja bem-vindo',
              style: GoogleFonts.secularOne(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(192, 187, 157, 1)
                  ),
              ),
            Text(
              'ao',
              style: GoogleFonts.secularOne(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(192, 187, 157, 1)
                  ),
              ),
            Text(
              'MOGEN',
              style: GoogleFonts.secularOne(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(192, 187, 157, 1)
                  ),
              ),
            
            const SizedBox(
                height: 20,
              ),

            Image.asset(
              'assets/imagens/linha.png',
              ),
            
            const SizedBox(
                height: 100,
              ),

            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),),);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                backgroundColor: Color.fromRGBO(50, 73, 55, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
              ),
              child: Text(
              'login',
              style: GoogleFonts.secularOne(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(192, 187, 157, 1)
                  ),
              ),
            ),
          
            const SizedBox(
              height: 15,
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Cadastrar(),),);
              },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(50, 73, 55, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11)),
            ), child: Text(
              'cadastrar',
              style: GoogleFonts.secularOne(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(192, 187, 157, 1)
                  ),
              ),),
          ]
          ),
        ) 
    );
  }
}