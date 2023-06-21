import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/buscaralumno_page.dart';
import 'package:justificaciones/src/pages/buscarmaestro_page.dart';
import 'package:justificaciones/src/pages/inicio_page.dart';
import 'package:justificaciones/src/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Justificaciones',
      initialRoute: '/',
      routes: {
        '/' : ( _ ) => const LoginPage(),
        'inicio' : ( BuildContext context) => const InicioPage(),
        'busA': ( BuildContext context) => const BuscarAlumnoPage(), 
        'busM': ( BuildContext context) => const BuscarMaestroPage(), 
        
      },
      

    );
    
    
  }
}