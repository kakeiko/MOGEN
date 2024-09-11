import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
const Header({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(21, 26, 20, 1)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 40, 150, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromRGBO(192, 187, 157, 1),
                size: 40,
                ),
              onPressed:() {
                Scaffold.of(context).openDrawer();
              },
              ),
            Text('MOGEN',
            style: GoogleFonts.secularOne(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(192, 187, 157, 1)
              ),
            ),
          ],
        ),
      )
    );
  }
}