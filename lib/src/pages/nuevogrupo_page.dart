import 'package:flutter/material.dart';
import 'package:justificaciones/src/services/grupos_service.dart';
import 'package:provider/provider.dart';

import '../widgets/alert_dialog_custom.dart';

class RegistrarGrupo extends StatelessWidget {
  RegistrarGrupo({super.key});

  final formKey = GlobalKey<FormState>();
  final Map<String, String> datosGrupos = {
    'nombre': '',
    'semestre': '',
    'carrera': '',
    'aula': ''
  };

  @override
  Widget build(BuildContext context) {
    final gruposService = Provider.of<GruposService>(context, listen: false);
    final isCargandoCrear = context.select((GruposService g) => g.isCargadoCrear);
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Grupo'),
        titleTextStyle:
            const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 81, 96, 143),
      ),
      body: isCargandoCrear ? const Center(child: Text('Creando Grupo...'),) : Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            _nombreInput(),
            const Divider(),
            _semestreInput(),
            const Divider(),
            _carreraInput(),
            const Divider(),
            _aulaInput(),
            const Divider(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final isFormularioValido =
                            formKey.currentState?.validate() ?? false;

                        if (!isFormularioValido) {
                          showDialog(
                              context: context,
                              builder: (_) => const AlertDialogCustom(
                                    title: '¡Error!',
                                    message: 'El formulario no valido.',
                                  ));
                          return;
                        }

                        final response =
                            await gruposService.crear(datosGrupos);

                        if (!response.success) {
                          if (context.mounted) {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialogCustom(
                                    title: '¡Error!',
                                    message: response.message));
                          }
                          return;
                        }

                        if (context.mounted) {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialogCustom(
                                  title: '¡Correcto!',
                                  message: response.message));
                        }
                },
                child: const Text('Crear'),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _nombreInput() {
    return TextFormField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Nombre del Grupo',
            labelText: 'Nombre',
            suffixIcon: const Icon(Icons.center_focus_strong_outlined),
            iconColor: const Color.fromARGB(255, 199, 176, 112),
            icon: const Icon(Icons.center_focus_strong_outlined)),
        onChanged: (valor) => datosGrupos['nombre'] = valor,
        validator: (valor) => valor == null || valor.isEmpty ? 'El campo es necesario' : null,);
  }

  Widget _semestreInput() {
    return TextFormField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Nombre del Semestre',
            labelText: 'Semestre',
            suffixIcon: const Icon(Icons.center_focus_strong_outlined),
            iconColor: const Color.fromARGB(255, 199, 176, 112),
            icon: const Icon(Icons.center_focus_strong_outlined)),
            validator: (valor) => valor == null || valor.isEmpty ? 'El campo es necesario' : null,
        onChanged: (valor) => datosGrupos['semestre'] = valor);
  }

  Widget _carreraInput() {
    return TextFormField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Nombre del Carrera',
            labelText: 'Carrera',
            suffixIcon: const Icon(Icons.center_focus_strong_outlined),
            iconColor: const Color.fromARGB(255, 199, 176, 112),
            icon: const Icon(Icons.center_focus_strong_outlined)),
            validator: (valor) => valor == null || valor.isEmpty ? 'El campo es necesario' : null,
        onChanged: (valor) => datosGrupos['carrera'] = valor);
  }

  Widget _aulaInput() {
    return TextFormField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Nombre del Aula',
            labelText: 'Aula',
            suffixIcon: const Icon(Icons.center_focus_strong_outlined),
            iconColor: const Color.fromARGB(255, 199, 176, 112),
            icon: const Icon(Icons.center_focus_strong_outlined)),
            validator: (valor) => valor == null || valor.isEmpty ? 'El campo es necesario' : null,
        onChanged: (valor) => datosGrupos['aula'] = valor);
  }
}