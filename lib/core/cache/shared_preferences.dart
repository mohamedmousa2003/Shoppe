import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPref;

  static Future<void> init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  //? set data
  static Future<bool> setData<T>(String key, T value) async {
    if (_sharedPref == null) await init();
    if (value is String) {
      return await _sharedPref!.setString(key, value);
    } else if (value is bool) {
      return await _sharedPref!.setBool(key, value);
    } else if (value is int) {
      return await _sharedPref!.setInt(key, value);
    } else if (value is double) {
      return await _sharedPref!.setDouble(key, value);
    } else if (value is List<String>) {
      return await _sharedPref!.setStringList(key, value);
    } else {
      throw Exception("Invalid type");
    }
  }

  //? Get Date
  static T? getData<T>(String key) {
    if (_sharedPref == null) return null;
    if (T == String) {
      return _sharedPref!.getString(key) as T?;
    } else if (T == bool) {
      return _sharedPref!.getBool(key) as T?;
    } else if (T == int) {
      return _sharedPref!.getInt(key) as T?;
    } else if (T == double) {
      return _sharedPref!.getDouble(key) as T?;
    } else if (T == List<String>) {
      return _sharedPref!.getStringList(key) as T?;
    } else {
      throw Exception("Invalid type");
    }
  }

  //? Delete Data
  static Future<bool> removeData(String key) async {
    if (_sharedPref == null) await init();
    return await _sharedPref!.remove(key);
  }
}
