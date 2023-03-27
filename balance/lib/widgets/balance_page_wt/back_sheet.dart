import 'package:flutter/material.dart';
import 'package:balance/utils/constants.dart';

class BackSheet extends StatelessWidget {
  const BackSheet({super.key});

  @override
  Widget build(BuildContext context) {
    _cabeceras(String nombre, String cantidad, Color color) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13, bottom: 5),
            child: Text(
              nombre,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Text(
            cantidad,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: color,
            ),
          ),
        ],
      );
    }

    return Container(
      height: 250,
      decoration:
          Constants.sheetBoxDecoration(Theme.of(context).primaryColorDark),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _cabeceras('Ingresos', '\$3,500.00', Colors.green),
          VerticalDivider(
            thickness: 10,
            color: Theme.of(context).primaryColorLight,
          ),
          _cabeceras('Gastos', '\$2,000.00', Colors.red),
        ],
      ),
    );
  }
}
