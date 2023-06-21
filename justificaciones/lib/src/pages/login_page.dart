import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, String> formValues = {
    'email': '',
    'password': ''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text('Correo Electrónico')),
                  onChanged: (value) => formValues['email'] = value,
                  validator: (value) {
                    if(value == null) {
                      return 'El Correo Electrónico es requerido.';
                    }
                    const patron = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$';
                    final regex = RegExp(patron);
                    if(!regex.hasMatch(value)) {
                      return 'El Correo Electrónico no tiene el formato requerido.';
                    }
                    return null;
                  } ,
                ),
                const Divider(),
                TextFormField(
                  decoration: const InputDecoration(label: Text('Contraseña')),
                  onChanged: (value) => formValues['password'] = value,
                  validator: (value) => value == null ? null : 'La Contraseña es requerida.',
                ),
                const SizedBox(height: 40.0,),
                ElevatedButton(onPressed: (){}, child: const Text('Iniciar Sesión'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}