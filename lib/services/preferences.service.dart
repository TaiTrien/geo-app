
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const _kToken = 'token';

  static getInstance() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static setToken(String token) async {
    var prefs = await getInstance();
    await prefs.setString(_kToken, token);
  }

  static getToken() async {
    var prefs = await getInstance();
    return prefs.getString(_kToken);
  }

  static removeToken() async {
    var prefs = await getInstance();
    return prefs.remove(_kToken);
  }
}
