import 'package:flutter/material.dart';

class BasicScaffoldScreen extends StatelessWidget {
  final Widget child;
  final Widget? drawer;

  const BasicScaffoldScreen({super.key, required this.child, this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer,
        appBar: AppBar(
          title: const Text("GCON Gestão de Concursos"),
          //actions: [Text("Address"), Divider(), Text("Professional")],
        ),
        persistentFooterAlignment: AlignmentDirectional.centerStart,
        persistentFooterButtons: [
          Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            IconButton(onPressed: () => {}, icon: const Icon(Icons.home)),
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.monetization_on)),
            IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.supervised_user_circle)),
            Flexible(
                flex: 2,
                child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      child: const Text("Salvar"),
                      onPressed: () => {},
                    )))
          ])
        ],
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: child,
              ))
            ]));
  }
}
