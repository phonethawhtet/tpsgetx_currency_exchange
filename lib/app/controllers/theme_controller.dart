import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Common Style
final TextStyle gameTitleTextStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
final TextStyle gameMenuLevelTextStyle =
    TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold);

//Controller specific style
final TextStyle _cardTitleTextStyleLight =
    TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold);
final TextStyle _menuTitleTextStyleLight =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
final TextStyle _gameTitleTextStyleLight =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
final TextStyle _gameMenuLevelTextStyleLight =
    TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold);

final TextStyle _cardDescTextStyleLight = TextStyle(
    fontFamily: "Zawgyi",
    color: Colors.black87,
    fontSize: 16,
    fontWeight: FontWeight.normal);

final TextStyle _cardTitleTextStyleDark =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
final TextStyle _menuTitleTextStyleDark =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
final TextStyle _gameTitleTextStyleDark =
    TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
final TextStyle _gameMenuLevelTextStyleDark =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

final TextStyle _cardDescTextStyleDark = TextStyle(
    fontFamily: "Zawgyi",
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal);

class ThemeController extends GetxController {
  var _activeThemeIndex = 0.obs;

  final ThemeData appThemeDataBlue = ThemeData(
      primaryColor: Colors.blue,
      accentColor: Colors.blueAccent,
      splashColor: Colors.blueAccent,
      highlightColor: Colors.blue,
      iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 115)),
      //fontFamily: 'Georgia',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      ),
      sliderTheme: SliderThemeData(
          thumbColor: Color.fromARGB(255, 0, 0, 115),
          activeTrackColor: Color.fromARGB(255, 0, 0, 85)),
      buttonTheme: ButtonThemeData(splashColor: Colors.blueGrey));

  final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white30,
      primaryColor: Colors.black54,
      accentColor: Colors.black26,
      splashColor: Colors.black26,
      highlightColor: Colors.black26,
      iconTheme: IconThemeData(color: Color.fromARGB(255, 150, 150, 150)),
      //fontFamily: 'Georgia',
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      sliderTheme: SliderThemeData(
          thumbColor: Color.fromARGB(255, 100, 100, 105),
          inactiveTrackColor: Color.fromARGB(255, 210, 210, 215),
          activeTrackColor: Color.fromARGB(255, 110, 110, 115)),
      buttonTheme: ButtonThemeData(splashColor: Colors.grey));

  final ThemeData appThemeDataRed = ThemeData(
      primaryColor: Colors.red,
      accentColor: Colors.redAccent,
      splashColor: Colors.redAccent,
      highlightColor: Colors.red,
      //fontFamily: 'Georgia',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      ),
      sliderTheme: SliderThemeData(
          thumbColor: Color.fromARGB(255, 115, 0, 0),
          activeTrackColor: Color.fromARGB(255, 85, 0, 0)),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 115, 0, 0)),
      buttonTheme: ButtonThemeData(splashColor: Colors.redAccent));

  final ThemeData appThemeDataPurple = ThemeData(
      primaryColor: Colors.purple,
      accentColor: Colors.purpleAccent,
      splashColor: Colors.purpleAccent,
      highlightColor: Colors.purple,
      //fontFamily: 'Georgia',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      ),
      sliderTheme: SliderThemeData(
          thumbColor: Colors.deepPurple, activeTrackColor: Colors.purple),
      iconTheme: IconThemeData(color: Colors.deepPurple),
      buttonTheme: ButtonThemeData(splashColor: Colors.purpleAccent));

  var _themes = [];
  var _isDarkMode = false.obs;

  ThemeData get activeTheme =>
      isDarkMode ? darkTheme : _themes[_activeThemeIndex.value];

  get menuBackgroundColor => activeTheme.primaryColor;
  get gamemenuColor => activeTheme.primaryColor;

  get cardTitleTextStyle =>
      isDarkMode ? _cardTitleTextStyleDark : _cardTitleTextStyleLight;

  get menuTitleTextStyle =>
      isDarkMode ? _menuTitleTextStyleLight : _menuTitleTextStyleDark;
  get gameTitleTextStyle =>
      isDarkMode ? _gameTitleTextStyleDark : _gameTitleTextStyleLight;

  get cardDescTextStyle =>
      isDarkMode ? _cardDescTextStyleDark : _cardDescTextStyleLight;
  final Color menuColor = Colors.white;
  get isDarkMode => _isDarkMode.value;
  void onInit() {
    super.onInit();
    _themes = [appThemeDataBlue, appThemeDataRed, appThemeDataPurple];
  }

  applyNextTheme() {
    (_activeThemeIndex.value + 1) < _themes.length
        ? _activeThemeIndex.value++
        : _activeThemeIndex.value = 0;
    Get.changeTheme(activeTheme);
  }

  setDarkMode(bool status) {
    if (status)
      Get.changeThemeMode(ThemeMode.dark);
    else {
      Get.changeThemeMode(ThemeMode.light);
      // Get.changeTheme(activeTheme);
    }
    _isDarkMode.value = status;
  }
}
