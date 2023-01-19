import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpsgetx3/app/controllers/theme_controller.dart';
import '../data/repository/appstate_repository.dart';

class AppController extends GetxController {
  //Static --------------------------------------------------------NONE

  //Initialised properties  --------------------------------------
  final AppStateRepository repository;
  AppController({required this.repository}) : assert(repository != null);
  final themeCtrl = Get.find<ThemeController>();
  //Public  -------------------------------------------------------NONE

  //Private -------------------------------------------------------

  onInit() {
    super.onInit();
    setup();
    //Controller Initialization
  }

  //Getters
  get runtime => repository.getProperty(AppStateRepository.RuntimeKey) ?? 0;
  get someValue =>
      repository.getProperty(someValue); //TODO: use with property name

  //Setters -------------------------------------------------------
  set runtime(value) => repository.runtime = value;
  set someValue(value) => repository.updateProperty(
      someValue, value); //TODO: use with property name

  //Public Methods ( Functions) -----------------------------------
  Future<void> setup() async {
    await repository.fetchProperty(); //update repo with latest value
    return;
  }

  Future<void> updateTheme() async {
    var darkMode = (repository.getProperty("darkmode") ?? false);
    if (darkMode) {
      themeCtrl.setDarkMode(true);
    }
    return;
  }

  Future<void> increaseRuntime() async {
    await repository.updateProperty(AppStateRepository.RuntimeKey, ++runtime);
    return;
  }
  //Private Methods ( used internally ) ---------------------------

}
