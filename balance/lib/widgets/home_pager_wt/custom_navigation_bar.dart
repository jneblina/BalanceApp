import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:balance/provider/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);

    return BottomNavigationBar(
        currentIndex: uiProvider.bnbIndex,
        elevation: 0,
        onTap: (int i) => uiProvider.bnbIndex = i,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_rounded), label: 'Balance'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded), label: 'Gráficos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: 'Ajustes'),
        ]);
  }
}
