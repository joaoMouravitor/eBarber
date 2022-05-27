import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      home: Home(),
    );
  }
}
