import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceValue {
  void setValue(int type, String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case 1:
        prefs.setString(key, value);
        break;
      case 2:
        prefs.setInt(key, value);
        break;
      case 3:
        prefs.setBool(key, value);
        break;
      case 4:
        prefs.setDouble(key, value);
      case 5:
        prefs.setStringList(key, value);
        break;
      default:
        break;
    }
  }

  dynamic getValue(int type, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case 1:
        return prefs.getString(key);

      case 2:
        return prefs.getInt(key);

      case 3:
        return prefs.getBool(key);

      case 4:
        return prefs.getDouble(key);
      case 5:
        return prefs.getStringList(key);

      default:
        break;
    }
  }
}
