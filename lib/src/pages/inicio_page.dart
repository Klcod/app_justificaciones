import 'package:flutter/material.dart';
import 'package:justificaciones/src/pages/nuevajustificacion_page.dart';  
import 'package:justificaciones/src/services/storage_service.dart';
import 'package:justificaciones/src/widgets/alert_dialog_custom.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final storageService = StorageService.getInstace();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        titleTextStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 81, 96, 143),
      ),

      body: ListView(
        children: <Widget>[

          const Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              Text('Justificaciones',
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 81, 96, 143)))
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 40)),
          if(storageService.hasRole('orientador'))
          const Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),
          if(storageService.hasRole('orientador'))
          ListTile(
              leading: const Icon(Icons.search,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: const Text('Buscar alumno',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () => Navigator.pushNamed(context, 'busA')),
          if(storageService.hasRole('alumno'))
          const Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),
          if(storageService.hasRole('alumno'))
          ListTile(
              leading: const Icon(Icons.assignment_outlined,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: const Text('Nueva justificación',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NuevaJustificacionPage(),
                  ),
                );
              }),
          if(storageService.hasRole('orientador'))
          const Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),
          if(storageService.hasRole('orientador'))
          ListTile(
              leading: const Icon(Icons.assignment_ind_outlined,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: const Text('Registrar alumno',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () => Navigator.pushNamed(context, 'registrar-alumno')),
          if(storageService.hasRole('orientador'))
          const Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),
          if(storageService.hasRole('orientador'))
          ListTile(
              leading: const Icon(Icons.assignment_ind_outlined,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: const Text('Buscar grupo',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () => Navigator.pushNamed(context, 'busG')),
          if(storageService.hasRole('orientador'))
          const Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),
          if(storageService.hasRole('orientador'))
          ListTile(
              leading: const Icon(Icons.assignment_ind_outlined,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: const Text('Registrar grupo',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () => Navigator.pushNamed(context, 'registrar-grupo')),
          const Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),
          ListTile(
              leading: const Icon(Icons.assignment_ind_outlined,
                  size: 45, color: Color.fromARGB(255, 199, 176, 112)),
              title: const Text('Cerrar Sesión',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  size: 55, color: Color.fromARGB(255, 199, 176, 112)),
              onTap: () async {
                final storageService = StorageService.getInstace();
                await storageService.deleteUserDataStorage();
                if(context.mounted) {
                  Navigator.pop(context);
                  showDialog(context: context, builder:( _ ) => const AlertDialogCustom(title: '¡Chau!', message: 'Adios :(',));
                }
              }),
          const Divider(thickness: 1, color: Color.fromARGB(255, 81, 96, 143)),
        ],
      ),
    );
  }
}
