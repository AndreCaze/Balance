import 'package:balance/pages/add_entries.dart';
import 'package:balance/pages/add_expenses.dart';
import 'package:balance/utils/page_route_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    List<SpeedDialChild> botones = [];

    //* Boton para agregar gasto
    botones.add(
      SpeedDialChild(
        backgroundColor: Colors.red,
        child: const Icon(Icons.remove),
        label: 'Gastos',
        labelStyle: const TextStyle(fontSize: 18),
        onTap: () {
          Navigator.push(
            context,
            AnimatedRoute(
              widget: const AddExpenses(),
              millisec: 500,
              curva: Curves.slowMiddle,
              valorx: 0.8,
              valory: 1,
            ),
          );
        },
      ),
    );

    //* Boton para agregar ingreso
    botones.add(
      SpeedDialChild(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        label: 'Ingresos',
        labelStyle: const TextStyle(fontSize: 18),
        onTap: () {
          Navigator.push(
              context,
              AnimatedRoute(
                widget: const AddEntries(),
              ));
        },
      ),
    );

    return SpeedDial(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      childMargin: const EdgeInsets.symmetric(horizontal: 6),
      childrenButtonSize: const Size(60, 60),
      icon: Icons.add,
      activeIcon: Icons.close,
      children: botones,
    );
  }
}
