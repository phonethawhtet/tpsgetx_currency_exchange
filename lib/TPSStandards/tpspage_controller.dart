// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tpsgetx3/app/data/repository/repository.dart';
// import 'package:tpsgetx3/app/controllers/user_controller.dart';
// import 'package:tpsgetx3/app/routes/app_routes.dart';

// class TPSPageController extends GetxController {
//   //Static --------------------------------------------------------NONE

//   //Initialised properties  --------------------------------------
//   final Repository repository;

//   TPSPageController({required this.repository}) : assert(repository != null);

//   //Public  -------------------------------------------------------NONE

//   //Private -------------------------------------------------------
//   var _isLoading = false.obs;
//   var _searchMode = false.obs;
//   final _userController = Get.find<UserController>();

//   //Getters
//   get isLoading => _isLoading.value;
//   get searchMode => _searchMode.value;

//   //Setters -------------------------------------------------------
//   set searchMode(value) => _searchMode.value = true;
//   onInit() {
//     super.onInit();

//     //Controller Initialization
//   }

//   //Public Methods ( Functions) -----------------------------------

//   //Private Methods ( used internally ) ---------------------------

//   //Public Methods  ( Routing : start with to) --------------------

//   toDetails({Function then}) {
//     //may pass value to used in arguments
//     Get.toNamed(Routes.DETAILS, arguments: null).then((value) {});
//   }

//   toOthers() {
//     Get.toNamed(Routes.OTHERS);
//   }
// }
