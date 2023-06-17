import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  String _nombre = '';
  String _email = '';
  String _nControl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Maestro'),
        titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 81, 96, 143),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          
          _creaeNombre(),
          Divider(),
          _crearTelefono(),
          Divider(),
          _crearCorreo(),
          Divider(),
          _crearEsp(),
          Divider(),
          _crearAula(),
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

  Widget _crearCorreo() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Correo',
            labelText: 'Correo',
            suffixIcon: Icon(Icons.email),
            iconColor: Color.fromARGB(255, 199, 176, 112),
            icon: Icon(Icons.email)),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearEsp() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Materia/Modulo',
          labelText: 'Materia/Modulo',
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
}