
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:justificaciones/src/models/usuario.dart';
import 'package:justificaciones/src/services/storage_service.dart';

import '../utils/sistema.dart';

class UsuariosService extends ChangeNotifier {
  List<Usuario> usuarios = [];
  bool isCargado = false;

  Future<void> buscarAlumno({String parametroBusqueda = ''}) async {
    final url = Uri.parse("${Sistema.urlBase}/api/usuarios/alumnos?param$parametroBusqueda");
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
        final List<dynamic> listaGrupos = json.decode(resp.body);

        usuarios.clear();

        for(var usuarioMap in listaGrupos) {
          final Map<String, dynamic> usuarioMapTemp = usuarioMap;
          final temGrupo = Usuario.fromJson(usuarioMapTemp);
          usuarios.add(temGrupo);
        }
      }
    } catch (e) {
      usuarios.clear();
    }
    isCargado = false;
    notifyListeners();
  }
}