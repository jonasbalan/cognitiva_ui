import 'package:cognitiva_ui/components/layout/basicScaffoldScreen.dart';
import 'package:cognitiva_ui/view/screens/concurso/concurso.index.dart';
import 'package:cognitiva_ui/view/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasicScaffoldScreen(
      drawer: DrawerMenu(),
      child: ConcursoListScreen(),
    );
  }
}
