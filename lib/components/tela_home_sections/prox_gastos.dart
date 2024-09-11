import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/components/comuns_sections/box_cart.dart';

class ProxGastos extends StatelessWidget {
const ProxGastos({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 40),
      child: 
      BoxCart(boxContent: _ProxGastosContent()),
    );
  }
}
class _ProxGastosContent extends StatelessWidget {
const _ProxGastosContent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 170, 0),
          child: 
            Text(
            'Próximos gastos:',
            style: GoogleFonts.secularOne(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(192, 187, 157, 1)
              ),
            ),
          ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: 
                Image.asset(
                  'assets/imagens/visu.png',
                  width: 50,
                ),
          ),            
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: 
                  Text(
                    'Nome do gasto',
                    style: GoogleFonts.secularOne(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(192, 187, 157, 1)
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 75, 0),
                  child: 
                    Text(
                      'xx/xx',
                      style: GoogleFonts.secularOne(
                        fontSize: 20,
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
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(192, 187, 157, 1)
                ),
                children: const <TextSpan>[
              TextSpan(
                text: '000,00'
              )
            ]
              ),
            ),
              )
          ],
        )
      ],);
  }
}