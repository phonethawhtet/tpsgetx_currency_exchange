import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpsgetx3/app/data/repository/repository.dart';
import 'package:tpsgetx3/app/controllers/user_controller.dart';

class SidemenuController extends GetxController {
  //Initialised properties  --------------------------------------
  // final Repository  repository; //Repository may be controller or other class providing data
  // SidemenuController({required this.repository}) : assert(repository != null);
  SidemenuController();

  //Static --------------------------------------------------------NONE

  //Public  -------------------------------------------------------NONE

  //Private -------------------------------------------------------
  var _isLoading = false.obs;
  var _searchMode = false.obs;
  final _userController = Get.find<UserController>();

  //Getters
  get isLoading => _isLoading.value;

  //Setters -------------------------------------------------------

  onInit() {
    super.onInit();

    //Controller Initialization
  }

  //Public Methods ( Functions) -----------------------------------

  //Private Methods ( used internally ) ---------------------------

  //Public Methods  ( Routing : start with to) --------------------

  toMenuItem(String route) {
    Get.back();
    Get.toNamed(route);
  }
}
