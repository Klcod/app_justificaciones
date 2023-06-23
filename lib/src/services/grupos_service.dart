
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import 'package:justificaciones/src/models/grupo.dart';
import 'package:justificaciones/src/services/storage_service.dart';
import 'package:justificaciones/src/utils/sistema.dart';

class GruposService extends ChangeNotifier {
  List<Grupo> grupos = [];

  Grupo? grupoSeleccionado;

  bool isCargado = false;

  GruposService() {
    cargarGrupos();
  }

  Future<void> cargarGrupos() async {
    final url = Uri.parse("${Sistema.urlBase}/api/grupos/with-users");
    final storageService = StorageService.getInstace();
    
    isCargado = true;
    notifyListeners();
    try {
      await storageService.cargarStorages();
      final token = storageService.getTokenUser();
      if(token.isEmpty) {
        await cargarGruposSinAuth();
        return;
      }

      final resp = await http.get(url, headers: {
        'Authorization': 'Bearer $token'
      });

      if(resp.statusCode == 200) {
        final List<dynamic> listaGrupos = json.decode(resp.body);

        for(var grupoMap in listaGrupos) {
          final Map<String, dynamic> grupoMapTemp = grupoMap;
          final temGrupo = Grupo.fromJson(grupoMapTemp);
          grupos.add(temGrupo);
        }
      }
    } catch (e) {
      grupos.clear();
    }
    isCargado = false;
    notifyListeners();
  }

  Future<void> cargarGruposSinAuth() async {
    final url = Uri.parse("${Sistema.urlBase}/api/grupos");
    
    isCargado = true;
    notifyListeners();

    try {

      final resp = await http.get(url);

      final List<dynamic> listaGrupos = json.decode(resp.body);

      for(var grupoMap in listaGrupos) {
        final temGrupo = Grupo.fromJson(grupoMap);
        grupos.add(temGrupo);
      }
    } catch (e) {
      grupos.clear();
    }
    isCargado = false;
    notifyListeners();
  }

  void cambiarGrupoSeleccionado(Grupo? nuevoGrupoSeleccionado) {
    grupoSeleccionado = nuevoGrupoSeleccionado;
    notifyListeners();
  }
}