// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class BSNumKeyboard extends StatefulWidget {
  const BSNumKeyboard({super.key});

  @override
  State<BSNumKeyboard> createState() => _BSNumKeyboardState();
}

class _BSNumKeyboardState extends State<BSNumKeyboard> {
  String importe = '0.00';

  @override
  Widget build(BuildContext context) {
    String Function(Match) mathFunc;
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc = (Match match) => '${match[1]},';

    return GestureDetector(
      onTap: () {
        _numPad();
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Text("Cantidad ingresada"),
            Text(
              '\$ ${importe.replaceAllMapped(reg, mathFunc)}',
              style: const TextStyle(
                  fontSize: 24, letterSpacing: 2, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  _numPad() {
    _num(String _text, double _height) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            if (importe == '0.00' || importe == "0") {
              importe = _text;
            } else if (!RegExp(r'^(\d+\.\d{2})?$').hasMatch(importe)) {
              importe += _text;
            } else {
              importe += "";
            }
          });
        },
        child: SizedBox(
          height: _height,
          child: Center(
            child: Text(
              _text,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
    }

    _btn(String _text, double _height, Color color, void Function() ontap) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: ontap,
        child: Container(
          height: _height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          child: Center(
            child: Text(
              _text,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
    }

    showModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // isDismissible: false,
        // enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SizedBox(
              height: 720,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                var height = constraints.biggest.height / 6;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Table(
                      border: TableBorder.symmetric(
                          inside: const BorderSide(
                        color: Colors.grey,
                        width: 0.1,
                      )),
                      children: [
                        TableRow(children: [
                          _num('1', height),
                          _num('2', height),
                          _num('3', height),
                        ]),
                        TableRow(children: [
                          _num('4', height),
                          _num('5', height),
                          _num('6', height),
                        ]),
                        TableRow(children: [
                          _num('7', height),
                          _num('8', height),
                          _num('9', height),
                        ]),
                        TableRow(children: [
                          _btn(".", height, Colors.transparent, () {
                            setState(() {
                              if (importe == '0.00') {
                                importe = '0';
                                importe += ".";
                              } else if (importe.contains(".")) {
                                importe += "";
                              } else {
                                importe += ".";
                              }
                            });
                          }),
                          _btn("0", height, Colors.transparent, () {
                            setState(() {
                              if (importe == "0.00") {
                                importe = "0";
                              } else if (!importe.contains(".") &&
                                  importe.startsWith("0")) {
                                importe += "";
                              } else if (importe.contains(".")) {
                                if (RegExp(r'^\d+(\.\d{2})?$')
                                    .hasMatch(importe)) {
                                  importe += "";
                                } else {
                                  importe += "0";
                                }
                              } else if (!importe.contains(".")) {
                                importe += "0";
                              }
                            });
                          }),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onLongPress: () {
                              setState(() {
                                importe = '0.00';
                              });
                            },
                            onTap: () {
                              setState(() {
                                if (importe.isNotEmpty) {
                                  importe =
                                      importe.substring(0, importe.length - 1);
                                }
                                if (importe == '' || importe == "0.0") {
                                  importe = '0.00';
                                }
                              });
                            },
                            child: SizedBox(
                                height: height,
                                child: const Icon(
                                  Icons.backspace,
                                  size: 35,
                                )),
                          ),
                        ]),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Constants.customButton(
                                Colors.red, Colors.transparent, 'Cancelar'),
                            onTap: () {
                              setState(() {
                                importe = '0.00';
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Constants.customButton(
                                Colors.green, Colors.transparent, 'Aceptar'),
                            onTap: () {
                              setState(() {
                                if (importe.isEmpty) importe = '0.00';
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          );
        });
  }
}
