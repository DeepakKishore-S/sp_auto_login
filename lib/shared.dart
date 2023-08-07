import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<bool> storeString(String key, String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(key, value);
  }

  static Future<String> getString(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? "";
  }

  static Future<bool> removed(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }

  static Future<bool> savebool(String key, value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(key, value);
  }

  static Future <bool?> getbool(String key) async {
   final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }
}


// name,age,phone number,address..