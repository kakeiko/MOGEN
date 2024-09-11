import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/components/comuns_sections/box_cart.dart';
import 'package:mogen/services/user_service.dart';

UserService service = UserService();

class DinheiroGastar extends StatelessWidget {
  final double? renda;
DinheiroGastar({ Key? key, required this.renda}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(38, 32, 38, 51),
      child: 
      BoxCart(boxContent: _DinheiroGastarContent(dinheiro: renda,)),
    );
  }
}

class _DinheiroGastarContent extends StatelessWidget {
final double? dinheiro;
const _DinheiroGastarContent({ Key? key, required this.dinheiro }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Column(
    children: <Widget>[
      Text('Dinheiro para gastar',
          style: GoogleFonts.secularOne(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(192, 187, 157, 1)
            ),
          ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text.rich(TextSpan(
            text:'R\$',
            style: GoogleFonts.secularOne(
            fontSize: 48,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(192, 187, 157, 1)
            ),
            children: <TextSpan>[
              TextSpan(
                text: '$dinheiro'
              )
            ]
            ))
        ],
      )
    ],
        ); 
  }
}