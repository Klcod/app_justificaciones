import 'package:flutter/material.dart';

class NuevaJustificacionPage extends StatefulWidget {
  //const NuevaJustificacionPage({super.key});

  @override
  _nuevaJustificacionState createState() => _nuevaJustificacionState();
}

  class _nuevaJustificacionState extends State<NuevaJustificacionPage> {

  String _nombre = '';
  String _email = '';
  String _nControl = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Salud';

  List<String> _poderes = ['Salud', 'Examen en otra universidad', 'Problemas familiares', 'otro'];

  TextEditingController _inputFieldDateController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nueva Justificación'),
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 81, 96, 143),
        ),
       body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _NumControl(),
          Divider(),
          _creaeNombre(),
          Divider(),
          _crearTelefono(),
          Divider(),
          _crearEsp(),
          Divider(),
          _crearAula(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearFechainicio(context), 
          Divider(),
          _crearFechafin(context), 
          Divider(),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Enviar'),
              style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(199, 176, 112, 1)
          ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _NumControl() {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'N° Control',
            labelText: 'N° Control',
            suffixIcon: Icon(Icons.center_focus_strong_outlined),
            iconColor: Color.fromARGB(255, 199, 176, 112),
            icon: Icon(Icons.center_focus_strong_outlined)),
        onChanged: (valor) => setState(() {
              _nControl = valor;
            }));
  }

  Widget _creaeNombre() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Nombre completo',
          suffixIcon: Icon(Icons.accessibility),
          iconColor: Color.fromARGB(255, 199, 176, 112),
          icon: Icon(Icons.account_circle)),
    );
  }

  Widget _crearTelefono() {
    return TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Teléfono',
            labelText: 'Teléfono',
            suffixIcon: Icon(Icons.phone_outlined),
            iconColor: Color.fromARGB(255, 199, 176, 112),
            icon: Icon(Icons.phone)),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearEsp() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Especialidad',
          labelText: 'Especialidad',
          suffixIcon: Icon(Icons.menu_book_sharp),
          iconColor: Color.fromARGB(255, 199, 176, 112),
          icon: Icon(Icons.book)),
    );
  }

  Widget _crearAula() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Aula',
          labelText: 'Aula',
          suffixIcon: Icon(Icons.group_outlined),
          iconColor: Color.fromARGB(255, 199, 176, 112),
          icon: Icon(Icons.group)),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = [];
    
    _poderes.forEach((motivo) { 
      lista.add( DropdownMenuItem(
        child: Text(motivo),
        value: motivo,
      ));
    });
    return lista; 

  }

  Widget _crearDropdown() {

    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
      Expanded(
        child: DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
            _opcionSeleccionada = opt!;
            });
          },
        ),
      )
    ],
  );

  }

  Widget _crearFechainicio(BuildContext context) {

    return  TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de inicio',
        labelText: 'Fecha de inicio',
        suffixIcon: Icon( Icons.perm_contact_calendar),
        icon: Icon( Icons.calendar_today), 
        iconColor: Color.fromARGB(255, 199, 176, 112),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );
  }

  Widget _crearFechafin(BuildContext context) {

    return  TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de fin',
        suffixIcon: Icon( Icons.perm_contact_calendar),
        icon: Icon( Icons.calendar_today),
        iconColor: Color.fromARGB(255, 199, 176, 112),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );
  }

  _selectDate(BuildContext context) async {

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    );

    if ( picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }


  }

  
}