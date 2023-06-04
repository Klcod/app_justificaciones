import 'package:flutter/material.dart';

class NuevaJustificacionPage extends StatelessWidget {
  const NuevaJustificacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nueva Justificación'),
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 81, 96, 143),
        ),
      
        body: Center(child: Text("Nueva Justificación Page"))

    );
  }
}