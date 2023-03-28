import 'package:flutter/material.dart';
import 'package:balance/utils/constants.dart';

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
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const Text('Cantidad ingresada'),
            Text(
              '\$ ${importe.replaceAllMapped(reg, mathFunc)}',
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
    _num(String _text, double _height) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            importe += _text;
          });
        },
        child: SizedBox(
          height: _height,
          child: Center(
            child: Text(
              _text,
              style: const TextStyle(fontSize: 30, color: Colors.grey),
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
        return WillPopScope(
          onWillPop: () async => false, //No permite que el notch fisico regrese
          child: SizedBox(
            height: 800,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              var _height = constraints.biggest.height / 6;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Table(
                      border: TableBorder.symmetric(inside: const BorderSide()),
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
                      Expanded(
                        child: GestureDetector(
                          child: Constants.customButton(
                              Colors.green, Colors.white, "Aceptar"),
                          onTap: () {
                            setState(() {
                              if (importe.isEmpty) importe = '0.00';
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Constants.customButton(
                              Colors.red, Colors.white, "Cancelar"),
                          onTap: () {
                            setState(() {
                              importe = "0.00";
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
