import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  const SharedPreferencesService(this._prefs);

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getString(String kye) {
    return _prefs.getString(kye);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<bool> removeSaved(String key) async{
    return _prefs.remove(key);
  }
}
