
import 'dart:convert';

import 'package:justificaciones/src/models/storage_model.dart';

import '../database/db.dart';

class StorageService {
  static StorageService? _instance;

  final userDataStorage = StorageModel(key: 'user_data', value: '');
  final Map<String, dynamic> userDataDecoded = {};
  
  StorageService._();

  static StorageService getInstace() {
    _instance ??= StorageService._();
    return _instance!;
  }

  Future<void> cargarStorages() async {
    final db = Db.db;

    final userDataStorageDB = await db.getStorage(userDataStorage.key);

    if(userDataStorageDB == null) return;

    userDataStorage.value = userDataStorageDB.value;
    final Map<String, dynamic> decodedData = json.decode(userDataStorage.value);
    userDataDecoded.addEntries(decodedData.entries);
  }

  Future<void> setUserDataStore(String value) async {
    final db = Db.db;

    final userDataStorageDB = await db.getStorage(userDataStorage.key);

    if(userDataStorageDB != null) return;

    await db.setStorage(userDataStorage.key, value);

    userDataStorage.value;
  }

  Future<void> deleteUserDataStorage() async {
    final db = Db.db;

    await db.deleteStorage(userDataStorage.key);

    userDataStorage.value = '';
    userDataDecoded.clear();
  }

  bool hasRole(String nombreRol) {
    if(userDataDecoded.isEmpty) return false;
    bool hasRole = false;

    for(Map<String, dynamic> roleMap in userDataDecoded['roles']) {
        if(roleMap.containsValue(nombreRol)) {
          hasRole = true;
          break;
        }
    }

    return hasRole;
  }
}