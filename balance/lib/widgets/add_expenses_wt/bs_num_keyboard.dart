import 'package:balance/widgets/add_expenses_wt/custom_button.dart';
import 'package:flutter/material.dart';

class BSNumKeyboard extends StatefulWidget {
  const BSNumKeyboard({super.key});

  @override
  State<BSNumKeyboard> createState() => _BSNumKeyboardState();
}

class _BSNumKeyboardState extends State<BSNumKeyboard> {
  String importe = '0.00';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _numPad();
      },
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const Text('Cantidad ingresada'),
            Text(
              '\$ $importe',
              style: const TextStyle(
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _numPad() {
    if (importe == '0.00') importe = '';
    _num(
      String _text,
      double _height,
    ) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            if (importe == '0.00') importe = '';
            importe += _text;
          });
        },
        child: SizedBox(
          height: _height,
          child: Center(
            child: Text(
              _text,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      );
    }

    showModalBottomSheet(
      // isDismissible: false,
      // enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 800,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            var _height = constraints.biggest.height / 6;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Table(
                    border: TableBorder.symmetric(
                        inside: const BorderSide(
                      color: Colors.white,
                      width: 2.5,
                    )),
                    children: [
                      TableRow(children: [
                        _num('1', _height),
                        _num('2', _height),
                        _num('3', _height),
                      ]),
                      TableRow(children: [
                        _num('4', _height),
                        _num('5', _height),
                        _num('6', _height),
                      ]),
                      TableRow(children: [
                        _num('7', _height),
                        _num('8', _height),
                        _num('9', _height),
                      ]),
                      TableRow(children: [
                        _num('.', _height),
                        _num('0', _height),
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
                            });
                          },
                          child: SizedBox(
                            height: _height,
                            child: const Icon(
                              Icons.backspace_rounded,
                              size: 35,
                            ),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      onPressed: () {},
                      label: 'Aceptar',
                      backgroundColor: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    CustomButton(
                      onPressed: () {},
                      label: 'Cancelar',
                      backgroundColor: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    )
                  ],
                )
              ],
            );
          }),
        );
      },
    );
  }
}
