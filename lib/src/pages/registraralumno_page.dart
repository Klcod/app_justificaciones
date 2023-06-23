import 'package:flutter/material.dart';
import 'package:justificaciones/src/models/grupo.dart';
import 'package:justificaciones/src/services/grupos_service.dart';
import 'package:provider/provider.dart';

class RegistrarAlumno extends StatefulWidget {
  const RegistrarAlumno({super.key});

  //const name({super.key});
  @override
  State<RegistrarAlumno> createState() => _RegistrarAlumnoState();
}

class _RegistrarAlumnoState extends State<RegistrarAlumno> {
//Capturar datos
  final Map<String, dynamic> datosAlumno = {
    'nombre'           : '',
    'apellido_paterno' : '',
    'apellido_materno' : '',
    'numero_control'   : '',
    'email'            : '',
    'password'         : '',
    'grupo_id'         : 0
  };

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  _initApp() {
    final gruposService = Provider.of<GruposService>(context, listen: false);
    gruposService.cargarGrupos();
  }

  @override
  Widget build(BuildContext context) {
    final gruposService = Provider.of<GruposService>(context);
    final isCargando = context.select((GruposService g) => g.isCargado);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Alumno'),
        titleTextStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 81, 96, 143),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _nombreInput(),
          const Divider(),
          _apellidoPaternoInput(),
          const Divider(),
          _apellidoMaternoInput(),
          const Divider(),
          _numControlInput(),
          const Divider(),
          _correoInput(),
          const Divider(),
          _contrasenaInput(),
          const Divider(),
          if(!isCargando)
          _grupoInput(context, gruposService),
          if(!isCargando)
          const Divider(),
          Center(
            child: ElevatedButton(
              onPressed: () {},
             style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(199, 176, 112, 1)
          ),
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nombreInput() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Nombre del alumno',
            labelText: 'Nombre',
            suffixIcon: const Icon(Icons.center_focus_strong_outlined),
            iconColor: const Color.fromARGB(255, 199, 176, 112),
            icon: const Icon(Icons.center_focus_strong_outlined)),
        onChanged: (valor) => datosAlumno['nombre'] = valor);
  }

  Widget _apellidoPaternoInput() {
    return TextFormField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Apellido Paterno del Alumno',
          labelText: 'Nombre',
          helperText: 'Nombre completo',
          suffixIcon: const Icon(Icons.accessibility),
          iconColor: const Color.fromARGB(255, 199, 176, 112),
          icon: const Icon(Icons.account_circle)),
    );
  }

  Widget _apellidoMaternoInput() {
    return TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Apellido Materno del Alumno',
            labelText: 'Apellido Materno',
            suffixIcon: const Icon(Icons.phone_outlined),
            iconColor: const Color.fromARGB(255, 199, 176, 112),
            icon: const Icon(Icons.phone)),
        onChanged: (valor) => datosAlumno['apellido_materno'] = valor);
  }

  Widget _numControlInput() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'No° de Control del Alumno',
          labelText: 'No° de Control',
          suffixIcon: const Icon(Icons.menu_book_sharp),
          iconColor: const Color.fromARGB(255, 199, 176, 112),
          icon: const Icon(Icons.book)),
    );
  }

  Widget _correoInput() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Correo Electrónico del Alumno',
          labelText: 'Correo Electrónico',
          suffixIcon: const Icon(Icons.group_outlined),
          iconColor: const Color.fromARGB(255, 199, 176, 112),
          icon: const Icon(Icons.group)),
      onChanged: (value) => datosAlumno['email'] = value
    );
  }

  Widget _contrasenaInput() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Contraseña del Alumno',
          labelText: 'Contraseña',
          suffixIcon: const Icon(Icons.group_outlined),
          iconColor: const Color.fromARGB(255, 199, 176, 112),
          icon: const Icon(Icons.group)),
      onChanged: (value) => datosAlumno['password'] = value
    );
  }

  Widget _grupoInput(BuildContext context, GruposService grupService) {
    final grupos = grupService.grupos;

    return Column(
      children: [
        const Text('Seleccione el Grupo del Alumno'),
        DropdownButtonFormField<Grupo>(
          items: grupos.map<DropdownMenuItem<Grupo>>((e) => DropdownMenuItem(
            value: e,
            child: Text(e.nombre),
          ),).toList(),
          onChanged: (value){
            grupService.cambiarGrupoSeleccionado(value);
            datosAlumno['grupo_id'] = value?.id ?? 0;
          },
        )
      ],
    );
  }
}
