import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:justificaciones/src/services/justificaciones_service.dart';
import 'package:provider/provider.dart';

import '../widgets/alert_dialog_custom.dart';

class NuevaJustificacionPage extends StatefulWidget {
  const NuevaJustificacionPage({super.key});

  //const NuevaJustificacionPage({super.key});

  @override
  NuevaJustificacionState createState() => NuevaJustificacionState();
}

  class NuevaJustificacionState extends State<NuevaJustificacionPage> {

  String _fecha = '';

  final List<String> _poderes = ['Salud', 'Examen en otra universidad', 'Problemas familiares', 'otro'];

  final TextEditingController _inputFechaInicio = TextEditingController();
  final TextEditingController _inputFechaFin = TextEditingController();

  final Map<String, dynamic> datosJustificacion = {
    'identificador': '',
    'fecha_inicio' : '',
    'fecha_fin' : '',
    'motivo': '',
    'email_docente': ''
  };

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final isCreando = context.select((JustificacionesService j) => j.isCargadoCrear);
    final justificacionesService = Provider.of<JustificacionesService>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Nueva Justificación'),
          titleTextStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 81, 96, 143),
        ),
       body: isCreando ? const Center(child: Text('Creando...'),) : Form(
        autovalidateMode: AutovalidateMode.always,
        key: formKey,
         child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _identificadorInput(),
            const Divider(),
            _motivoInput(),
            const Divider(),
            _emailDocenteInput(),
            const Divider(),
            _crearFechainicio(context), 
            const Divider(),
            _crearFechafin(context), 
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
                              await justificacionesService.crear(datosJustificacion);
       
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
                style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(199, 176, 112, 1)
            ),
                child: const Text('Enviar'),
              ),
            ),
          ],
             ),
       ),
    );
  }

  Widget _identificadorInput() {
    return TextFormField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Identificador de la justificacion',
            labelText: 'Identificador',
            suffixIcon: const Icon(Icons.center_focus_strong_outlined),
            iconColor: const Color.fromARGB(255, 199, 176, 112),
            icon: const Icon(Icons.center_focus_strong_outlined)),
            validator: (valor) => valor == null || valor.isEmpty ? 'Este campo es necesario' : null,
        onChanged: (valor) => datosJustificacion['identificador'] = valor);
  }

  Widget _motivoInput() {
    return TextFormField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Motivo de la justificacion',
          labelText: 'Motivo',
          suffixIcon: const Icon(Icons.accessibility),
          iconColor: const Color.fromARGB(255, 199, 176, 112),
          icon: const Icon(Icons.account_circle)),
          maxLines: null,
        validator: (valor) => valor == null || valor.isEmpty ? 'Este campo es necesario' : null,
        onChanged: (valor) => datosJustificacion['motivo'] = valor
    );
  }

  Widget _emailDocenteInput() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Email del docente',
            labelText: 'Email del docente',
            suffixIcon: const Icon(Icons.phone_outlined),
            iconColor: const Color.fromARGB(255, 199, 176, 112),
            icon: const Icon(Icons.phone)),
            validator: (valor) => valor == null || valor.isEmpty ? 'Este campo es necesario' : null,
            onChanged: (valor) => datosJustificacion['email_docente'] = valor
      );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = [];
    
    for (var motivo in _poderes) { 
      lista.add( DropdownMenuItem(
        value: motivo,
        child: Text(motivo),
      ));
    }
    return lista; 

  }

  Widget _crearFechainicio(BuildContext context) {

    return  TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFechaInicio,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de inicio',
        labelText: 'Fecha de inicio',
        suffixIcon: const Icon( Icons.perm_contact_calendar),
        icon: const Icon( Icons.calendar_today), 
        iconColor: const Color.fromARGB(255, 199, 176, 112),
      ),
      validator: (valor) => valor == null || valor.isEmpty || datosJustificacion['fecha_inicio'].toString().isEmpty? 'Este campo es necesario' : null,
      onChanged: (valor) => datosJustificacion['fecha_inicio'] = valor,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDateInicio( context );
      },
    );
  }

  Widget _crearFechafin(BuildContext context) {

    return  TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFechaFin,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de fin',
        suffixIcon: const Icon( Icons.perm_contact_calendar),
        icon: const Icon( Icons.calendar_today),
        iconColor: const Color.fromARGB(255, 199, 176, 112),
      ),
      validator: (valor) => valor == null || valor.isEmpty || datosJustificacion['fecha_fin'].toString().isEmpty ? 'Este campo es necesario' : null,
        onChanged: (valor) => datosJustificacion['fecha_fin'] = valor,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDateFin( context );
      },
    );
  }

  _selectDateInicio(BuildContext context) async {
    final DateFormat format = DateFormat("yyyy-MM-dd");

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );

    if ( picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFechaInicio.text = _fecha;
        datosJustificacion['fecha_inicio'] = format.format(picked);
      });
    }


  }
  _selectDateFin(BuildContext context) async {
    final DateFormat format = DateFormat("yyyy-MM-dd");

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );

    if ( picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFechaFin.text = _fecha;
        datosJustificacion['fecha_fin'] = format.format(picked);
      });
    }


  }

  
}