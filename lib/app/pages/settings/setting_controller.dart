import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpsgetx3/app/data/repository/appstate_repository.dart';
import '../../controllers/user_controller.dart';
import '../../data/repository/repository.dart';
import '../../controllers/theme_controller.dart';

class SettingsController extends GetxController {
  //Initialised properties  --------------------------------------
  final AppStateRepository
      repository; //Repository may be controller or other class providing data
  SettingsController({required this.repository}) : assert(repository != null);

  //Static --------------------------------------------------------NONE

  //Public  -------------------------------------------------------NONE

  //Private -------------------------------------------------------
  var _isLoading = false.obs;
  var _isShowMenu = false.obs; //Sample setting items
  final _userController = Get.find<UserController>();
  final _themeCtrl = Get.find<ThemeController>();

  //Getters
  get isLoading => _isLoading.value;
  get isShowMenu => _isShowMenu.value; //Sample setting item to reflect change
  get isDarkMode => _themeCtrl.isDarkMode;
  get activeTheme => _themeCtrl.activeTheme;

  //Setters -------------------------------------------------------
  set isDarkMode(value) => _themeCtrl.isDarkMode;
  set isShowMenu(value) {
    _isShowMenu.value = value;
    //Do other necessaries such as setting
  }

  onInit() {
    super.onInit();

    //Controller Initialization
  }

  //Public Methods ( Functions) -----------------------------------
  setDarkMode(value) {
    repository.updateProperty("darkmode", value);
    _themeCtrl.setDarkMode(value);
  }
  //Private Methods ( used internally ) ---------------------------

  //Public Methods  ( Routing : start with to) -------------------- NONE

}
