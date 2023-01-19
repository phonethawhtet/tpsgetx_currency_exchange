import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/theme_controller.dart';
import 'details_controller.dart';

class DetailsPage extends GetView<DetailsController> {
  final themeCtrl = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    controller.model =
        Get.arguments; //TODO: Pass the value from previous screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: [],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[],
          )),
    );
  }
}
