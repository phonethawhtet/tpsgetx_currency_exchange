import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppStateRepository {
  //Constant
  //
  static const String PropertyKey = 'property';
  static const String RuntimeKey = 'runtime';
  static const String LoggedInKey = 'loggedIn';

  Map<String, dynamic> _properties = {};

  get properties => _properties;

  SharedPreferences? _pref;
  AppStateRepository() {
    SharedPreferences.getInstance().then((value) => _pref = value);
  }

  //Getters
  // Future<int> get runtime async {
  //   _pref = _pref ?? await SharedPreferences.getInstance();
  //   return _pref?.getInt(RuntimeKey) ?? 0;
  // }

  //Setters
  set runtime(value) {
    if (_pref == null) {
      SharedPreferences.getInstance().then((pref) {
        _pref = pref;
        _pref?.setInt(RuntimeKey, value);
        return null;
      });
    }

    _pref?.setInt(RuntimeKey, value);
  }

  Future<void> updateProperty(key, value) async {
    _pref = _pref ?? await SharedPreferences.getInstance();

    _properties[key] = value;
    String propertyStr = jsonEncode(_properties);
    _pref?.setString(PropertyKey, propertyStr);
    return null;
  }

  //Getting existing value from memory, fetchProperty must be run first
  dynamic getProperty(String key) => _properties[key];

  Future<dynamic> fetchProperty([String key = ""]) async {
    //Fetch app preference values here for multiple value

    _pref = _pref ?? await SharedPreferences.getInstance();

    //Add other values if required as per project requirement
    var propertyStr = _pref?.getString(PropertyKey) ?? "{}";
    _properties = jsonDecode(propertyStr);

    return _properties[key];
  }
}
