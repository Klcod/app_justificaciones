import 'package:flutter/material.dart';

class BuscarMaestroPage extends StatelessWidget {
  const BuscarMaestroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buscar Maestro'),
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 81, 96, 143),
        ),
      
        body: Center(child: Text("Buscar Maestro Page"))

    );
  }
}