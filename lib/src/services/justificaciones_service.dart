
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:justificaciones/src/services/storage_service.dart';
import '../models/justificacion.dart';
import '../models/repuesta_api.dart';
import '../utils/sistema.dart';

class JustificacionesService extends ChangeNotifier {
  List<Justificacion> justificaciones = [];

  bool isCargado = false;
  
  bool isCargadoCrear = false;

  Future<void> buscarJustificaciones({String parametroBusqueda = ''}) async {
    final url = Uri.parse("${Sistema.urlBase}/api/justificaciones?param$parametroBusqueda");
    final storageService = StorageService.getInstace();
    
    isCargado = true;
    notifyListeners();
    try {
      await storageService.cargarStorages();
      final token = storageService.getTokenUser();
      if(token.isEmpty) return;

      final resp = await http.get(url, headers: {
        'Authorization': 'Bearer $token'
      });

      if(resp.statusCode == 200) {
        final List<dynamic> listaJustificaciones = json.decode(resp.body);

        justificaciones.clear();

        for(var justificacionMap in listaJustificaciones) {
          final Map<String, dynamic> justificacionMapTemp = justificacionMap;
          final temGrupo = Justificacion.fromJson(justificacionMapTemp);
          justificaciones.add(temGrupo);
        }
      }
    } catch (e) {
      justificaciones.clear();
    }
    isCargado = false;
    notifyListeners();
  }


  Future<RespuestaApi> crear(Map<String, dynamic> justificacion) async {
    final url = Uri.parse("${Sistema.urlBase}/api/justificaciones");
    final storageService = StorageService.getInstace();

    isCargadoCrear = true;
    notifyListeners();

    try {
      await storageService.cargarStorages();

      if(storageService.getTokenUser().isEmpty) return RespuestaApi(success: false, message: 'Tiempo de sesión expirado, cierra sesión y ingrese nuevamente.');

      final resp = await http.post(url, 
        body: json.encode(justificacion),
        headers: {
          'Authorization': 'Bearer ${storageService.getTokenUser()}',
          'Content-Type': 'application/json'
        }
      );

      final Map<String, dynamic> decodedData = json.decode(resp.body);

      isCargadoCrear = false;
      notifyListeners();

      return RespuestaApi.fromJson(decodedData);
      
    } catch (e) {
      isCargadoCrear = false;
      notifyListeners();
      return RespuestaApi(success: false, message: 'Ha ocurrido un error inesperado.');
    }
  }
}