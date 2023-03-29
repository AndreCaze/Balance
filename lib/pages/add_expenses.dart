import 'package:balance/widgets/add_expenses_wt/bs_num_keyboard.dart';
import 'package:balance/widgets/add_expenses_wt/comment_box.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Agregar Gasto'),
        ),
        body: Column(
          children: [
            const BSNumKeyboard(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: Constants.sheetBoxDecoration(
                  Theme.of(context).primaryColorDark,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Fecha 22 de marzo del 2023'),
                    Text('Seleccionar Categoria'),
                    CommentBox(),
                    Expanded(
                      child: Center(
                        child: Text('Boton'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
