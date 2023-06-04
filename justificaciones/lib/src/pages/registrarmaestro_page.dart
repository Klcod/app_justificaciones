import 'package:flutter/material.dart';

class RegistrarMaestroPage extends StatelessWidget {
  const RegistrarMaestroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Maestro'),
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 81, 96, 143),
        ),
      
        body: Center(child: Text("Registrar Maestro Page"))

    );
  }
}