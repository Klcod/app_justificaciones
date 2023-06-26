
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:justificaciones/src/models/login_model.dart';
import 'package:justificaciones/src/models/repuesta_api.dart';
import 'package:justificaciones/src/services/storage_service.dart';
import 'package:justificaciones/src/utils/sistema.dart';

class CuentasService extends ChangeNotifier {
  bool isCargando = false;

  Future<RespuestaApi> iniciarSesion(LoginModel loginModel) async {
    final url = Uri.parse('${Sistema.urlBase}/api/cuentas/login');
    final storageService = StorageService.getInstace();
    await storageService.cargarStorages();
    RespuestaApi respuesta;
    isCargando = true;
    notifyListeners();
    try {
      final resp = await http.post(url, body: json.encode(loginModel.toJson()), headers: {
        'Content-Type': 'application/json'
      });
      
      final Map<String, dynamic> decodedData = json.decode(resp.body);

      if(resp.statusCode == 200) {
        await storageService.deleteUserDataStorage();
        await storageService.setUserDataStore(json.encode(decodedData['helper_data']));
        await storageService.cargarStorages();
      }

      respuesta = RespuestaApi.fromJson(decodedData);
    } catch (e) {
      respuesta = RespuestaApi(success: false, message: 'Ha ocurrido un error inesperado');
    }
    isCargando = false;
    notifyListeners();
    return respuesta;
  }

  Future<RespuestaApi> registrarAlumno(Map<String, dynamic> alumno) async {
    final url = Uri.parse("${Sistema.urlBase}/api/cuentas/register/alumno");
    final storageService = StorageService.getInstace();

    await storageService.cargarStorages();

    final resp = await http.post(url, body: json.encode(alumno), headers: {
      'Authorization': 'Bearer ${storageService.getTokenUser()}'
    });
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    if(decodedData.containsKey('errors')) {
      final response = RespuestaApi(success: false, message: '');
      final Map<String, dynamic> errors = decodedData['errors'];
      StringBuffer stringBuffer = StringBuffer();

      stringBuffer.write('Tienes los siguientes errores de validacion:\n');

      errors.forEach((key, value) {
        if(key == 'password') {
          stringBuffer.write('contraseña:\n');
        } else {
          stringBuffer.write(key);
        }
        for(var error in value) {
          stringBuffer.write('\t $error \n');
        }
      });

      response.message = stringBuffer.toString();
      
      return response;
    }

    return RespuestaApi.fromJson(decodedData);
  }
}