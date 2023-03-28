import 'package:balance/utils/constants.dart';
import 'package:balance/widgets/add_expenses_wt/comments_box.dart';
import 'package:flutter/material.dart';

import '../widgets/add_expenses_wt/bs_num_keyboard.dart';

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
            centerTitle: true,
            title: const Text('Agregar Gastos'),
            elevation: 4,
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
                      Text("Fecha 22 de marzo de 2023"),
                      Text("Seleccionar la categoria"),
                      CommentBox(),
                      Expanded(
                          child: Center(
                        child: Text("Botón"),
                      )),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
