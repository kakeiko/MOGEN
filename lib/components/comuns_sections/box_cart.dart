import 'package:flutter/material.dart';

class BoxCart extends StatelessWidget {
final Widget boxContent;
const BoxCart({ Key? key, required this.boxContent }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: boxContent,
      padding: const EdgeInsets.fromLTRB(0, 22, 0, 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(76, 100, 78, 1),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(3, 5),
        )]
      ),
    );
  }
}