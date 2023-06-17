import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/buscaralumno_page.dart';
import 'package:justificaciones/src/pages/buscarmaestro_page.dart';
import 'package:justificaciones/src/pages/inicio_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Justificaciones',
      initialRoute: 'inicio',
      routes: {
        'inicio' : ( BuildContext context) => InicioPage(),
        'busA': ( BuildContext context) => BuscarAlumnoPage(), 
        'busM': ( BuildContext context) => BuscarMaestroPage(), 
        
      },
      

    );
    
    
  }
}