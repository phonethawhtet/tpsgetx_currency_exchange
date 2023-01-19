 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';
 
import 'details_controller.dart';

class DetailsImagePage extends GetView<DetailsController> {
  final themeCtrl = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Get.back();
          },
        ),
        body: Center());
  }
}
