import 'package:flutter/material.dart';
import 'package:balance/pages/balance_page.dart';
import 'package:balance/pages/charts_page.dart';
import 'package:balance/pages/settings_page.dart';
import 'package:balance/widgets/home_pager_wt/custom_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../provider/ui_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.bnbIndex;
    switch (currentIndex) {
      case 0:
        return const BalancePage();
      case 1:
        return const ChartsPages();
      case 2:
        return const SettingsPage();
      default:
        return const BalancePage();
    }
  }
}
