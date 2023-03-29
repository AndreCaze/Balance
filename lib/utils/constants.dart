// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class Constants {
  static sheetBoxDecoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ));
  }

  static customButton(Color decoration, Color border, String _text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: decoration,
          border: Border.all(color: border),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            _text,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}















// const SizedBox(
//                     height: 10,
//                   ),
//                   Table(
//                     border: TableBorder.symmetric(
//                         inside: const BorderSide(
//                       color: Colors.grey,
//                       width: 0.1,
//                     )),
//                     children: [
//                       TableRow(children: [
//                         _btn('Aceptar', 50, Colors.green, () {
//                           Navigator.pop(context);
//                         }),
//                         _btn('Cancelar', 50, Colors.red, () {
//                           setState(() {
//                             importe = '0.00';
//                             Navigator.pop(context);
//                           });
//                         }),
//                       ])
//                     ],
//                   )