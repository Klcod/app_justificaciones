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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar maestros'),
        titleTextStyle:
         const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          
          ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 81, 96, 143),
      ),
      body: 
      ListView(
        children: <Widget> [
        Form(
          key: _formKey,
          child: Column(
      
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40.0),
              TextFormField(
                
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  labelText: 'Nombre',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 199, 176, 112),
                  ),
                  
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  labelText: 'Teléfono',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 199, 176, 112),
                  ),
      ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa tu teléfono';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  labelText: 'Correo',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 199, 176, 112),
                    ),
                  ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa tu correo';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  labelText: 'Materia',
                  prefixIcon: Icon(
                    Icons.book,
                    color: Color.fromARGB(255, 199, 176, 112),
                    ),
                  ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa la materia';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  labelText: 'Aula',
                  prefixIcon: Icon(
                    Icons.group,
                    color: Color.fromARGB(255, 199, 176, 112)),
                  ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa el aula';
                  }
                  return null;
                },
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  
                  child: const Text('Enviar'),
                ),
              ),
            ],
          ),
       ),
        ]
      ),
    );
  }
}