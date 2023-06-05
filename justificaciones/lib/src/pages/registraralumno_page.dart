import 'package:flutter/material.dart';

class RegistrarAlumnoPage extends StatelessWidget {
  const RegistrarAlumnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Alumno'),
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 81, 96, 143),
        ),
      
        body: Center(child: Text("Registrar Alumno Page"))

    );
  }
}