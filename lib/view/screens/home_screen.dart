import 'package:cognitiva_ui/view/screens/concurso/concurso.edit.dart';
import 'package:cognitiva_ui/view/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        appBar: AppBar(
          title: const Text("Dynamic Entities Example"),
          //actions: [Text("Address"), Divider(), Text("Professional")],
        ),
        persistentFooterAlignment: AlignmentDirectional.bottomStart,
        persistentFooterButtons: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.monetization_on)),
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.supervised_user_circle))
        ],
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConcursoEditScreen(),
              ))
            ]));
  }
}
