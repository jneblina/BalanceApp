import 'package:balance/pages/add_expenses.dart';
import 'package:balance/pages/custom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    List<SpeedDialChild> botones = [];

    botones.add(
      SpeedDialChild(
        backgroundColor: Colors.red,
        child: const Icon(Icons.remove_rounded),
        label: 'Gasto',
        labelStyle: const TextStyle(fontSize: 18),
        onTap: () {
          Navigator.push(
              context,
              CustomAnimation(
                  page: const AddExpenses(),
                  duration: const Duration(milliseconds: 800),
                  alineacion: const Alignment(0.8, 1),
                  curve: Curves.bounceInOut));
        },
      ),
    );

    botones.add(
      SpeedDialChild(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_rounded),
        label: 'Ingreso',
        labelStyle: const TextStyle(fontSize: 18),
        onTap: () {
          // Navigator.pushNamed(context, 'addEntries');
          Navigator.push(
              context,
              CustomAnimation(
                  page: const AddExpenses(),
                  duration: const Duration(milliseconds: 800),
                  alineacion: const Alignment(0.8, 1),
                  curve: Curves.bounceInOut));
        },
      ),
    );

    return SpeedDial(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      childMargin: const EdgeInsets.symmetric(horizontal: 6),
      childrenButtonSize: const Size(60, 60),
      icon: Icons.add_rounded,
      activeIcon: Icons.close_rounded,
      children: botones,
    );
  }
}
