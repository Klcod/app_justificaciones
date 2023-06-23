import 'package:flutter/material.dart';
import 'package:justificaciones/src/services/cuentas_service.dart';
import 'package:justificaciones/src/services/grupos_service.dart';

import 'package:provider/provider.dart';

import 'package:justificaciones/src/pages/buscaralumno_page.dart';
import 'package:justificaciones/src/pages/buscarmaestro_page.dart';
import 'package:justificaciones/src/pages/inicio_page.dart';
import 'package:justificaciones/src/pages/login_page.dart';

void main() => runApp(
  MultiProvider(
    providers: [
    ChangeNotifierProvider(create: ( _ ) => CuentasService()),
    ChangeNotifierProvider(create: ( _ ) => GruposService()),
    ],
    child: const MyApp(),
  )
);

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