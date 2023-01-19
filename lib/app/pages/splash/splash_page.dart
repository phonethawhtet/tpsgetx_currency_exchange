import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart';
import 'package:tpsgetx3/app/pages/widgets/loading_widget.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    final menuRatio = 5.0;
    final height = Get.height / menuRatio;

    return Scaffold(body: LoadingWidget());
  }
}
