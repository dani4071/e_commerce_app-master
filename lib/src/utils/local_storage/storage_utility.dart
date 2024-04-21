import 'package:get_storage/get_storage.dart';


class danLocalStorage {

  late final GetStorage _storage;

  // Singleton instance
  static danLocalStorage? _instance;

  danLocalStorage._internal();

  factory danLocalStorage.instance() {
    _instance ??= danLocalStorage._internal();
    return _instance!;
  }
/// i understood it incase when you come back and have forgotten this, to understand this line perfect check video 48  --12:00
  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = danLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }


  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Genetic method to read data
  T? readData<T>(String key){
    return _storage.read<T>(key);
  }


  // Genetic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearALl() async {
    await _storage.erase();
  }


}