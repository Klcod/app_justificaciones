
import 'package:justificaciones/src/models/storage_model.dart';

import '../database/db.dart';

class StorageService {
  static StorageService? _instance;

  final userDataStorage = StorageModel(key: 'user_data', value: '');
  
  StorageService._();

  static StorageService getInstace() {
    _instance ??= StorageService._();
    return _instance!;
  }

  Future<void> cargarStorages() async {
    final db = Db.db;

    final userDataStorageDB = await db.getStorage(userDataStorage.key);

    if(userDataStorageDB != null) return;
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
  }
}