import 'package:flutter/material.dart';
import 'package:justificaciones/src/models/login_model.dart';
import 'package:justificaciones/src/services/cuentas_service.dart';
import 'package:justificaciones/src/widgets/alert_dialog_custom.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final loginModel = LoginModel(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    final cuentasService = Provider.of<CuentasService>(context, listen: false);
    final isCargando = context.select((CuentasService c) => c.isCargando);

    return Scaffold(
      body: SafeArea(
        child: isCargando ? const Center(child: CircularProgressIndicator(),) : Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text('Correo Electrónico')),
                  onChanged: (value) => loginModel.email = value,
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
                  onChanged: (value) => loginModel.password = value,
                  validator: (value) => value != null && value.isNotEmpty ? null : 'La Contraseña es requerida.',
                ),
                const SizedBox(height: 40.0,),
                ElevatedButton(onPressed: () async {
                  final isFormularioValido = formKey.currentState?.validate() ?? false;

                  if(!isFormularioValido) {
                    showDialog(context: context, 
                      builder: ( _ ) => const AlertDialogCustom(title: '¡Error!', message: 'Hay errores de validación.'));
                    return;
                  }

                  final respuesta = await cuentasService.iniciarSesion(loginModel);

                  if(!respuesta.success) {
                    if(context.mounted) {
                      showDialog(context: context,
                        builder: ( _ ) => AlertDialogCustom(title: '¡Error!', message: respuesta.message));
                    }
                    return;
                  }

                  if(context.mounted) {
                    Navigator.pushNamed(context, 'inicio');
                    showDialog(context: context,
                        builder: ( _ ) => AlertDialogCustom(title: '¡Correcto!', message: respuesta.message));
                  }

                }, child: const Text('Iniciar Sesión'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}