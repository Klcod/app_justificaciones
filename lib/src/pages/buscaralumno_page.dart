import 'package:flutter/material.dart';
import 'package:justificaciones/src/services/usuarios_service.dart';
import 'package:provider/provider.dart';

class BuscarAlumnoPage extends StatelessWidget {
  const BuscarAlumnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buscar Alumno'),
          titleTextStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 81, 96, 143),
        ),
      body: /*Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/panter.png'))
        ),*/
         buscador(context),

    );
  }
  
  Widget buscador(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final alumnos = context.select((UsuariosService u) => u.usuarios);
    final isBuscando = context.select((UsuariosService u) => u.isCargado);
    final usuariosService = Provider.of<UsuariosService>(context);
    String parametroBusqueda = '';

    final buscador = Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      width: size.width*0.35,
      child: TextField(
        
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'ID, Nombre, No. Control',
        ),
        onChanged: (value) => parametroBusqueda = value,
      ),
      
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10,),
              const Text('Buscar:', style: TextStyle(fontSize: 15),),
              const SizedBox(width: 10,),
              buscador,
              const SizedBox(width: 10,),
              ElevatedButton(onPressed: () async {
                await usuariosService.buscarAlumno(parametroBusqueda: parametroBusqueda);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(199, 176, 112, 1)
              ), child: const Text('Buscar', style: TextStyle(fontSize: 9),),),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: () {
                  
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(199, 176, 112, 1)
              ), child: const Text('Registrar', style: TextStyle(fontSize: 9),),
              )
            ]
          ),
          isBuscando 
          ? const Text('Buscando') 
          : alumnos.isEmpty
          ? const Text('Sin grupos')
          : Column(
            children: List<Widget>.from(alumnos.map((e) => SizedBox(
              width: double.infinity,
              child: Card(
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${e.id}'),
                        Text('Nombre: ${e.nombreCompleta}'),
                        Text('No. Control: ${e.numeroControl}'),
                        Text('email: ${e.email}'),
                      ],
                    ),
                  ),
                ),
              ),
            )))
          )
        ],
      ), 
        /*decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/panter.png'))
        ),*/
    );

  }
       
}