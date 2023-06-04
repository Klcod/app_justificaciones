import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/buscaralumno_page.dart';
import 'package:justificaciones/src/pages/buscarmaestro_page.dart';
import 'package:justificaciones/src/pages/nuevajustificacion_page.dart';
import 'package:justificaciones/src/pages/registraralumno_page.dart';
import 'package:justificaciones/src/pages/registrarmaestro_page.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 81, 96, 143),
      ),

      body: ListView(
        children: <Widget>[

          Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              Text('Justificaciones',
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 81, 96, 143)))
            ],
          ),

          Padding(padding: EdgeInsets.only(bottom: 40)),
          Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),

          ListTile(
              leading: Icon(Icons.search,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: Text('Buscar alumno',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuscarAlumnoPage(),
                  ),
                );
              }),
          Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),

          ListTile(
              leading: Icon(Icons.search,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: Text('Buscar maestro',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuscarMaestroPage(),
                  ),
                );
              }),
          Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),

          ListTile(
              leading: Icon(Icons.assignment_outlined,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: Text('Nueva justificación',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NuevaJustificacionPage(),
                  ),
                );
              }),
          Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),

          ListTile(
              leading: Icon(Icons.assignment_ind_outlined,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: Text('Registrar alumno',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrarAlumnoPage(),
                  ),
                );
              }),
          Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),

          ListTile(
              leading: Icon(Icons.assignment_ind_outlined,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: Text('Registrar maestro',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrarMaestroPage(),
                  ),
                );
              }),
          Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143))
        ],
      ),
    );
  }
}
