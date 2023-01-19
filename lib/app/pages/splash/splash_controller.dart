import 'package:get/get.dart';
import 'package:tpsgetx3/app/controllers/app_controller.dart';
import 'package:tpsgetx3/app/routes/app_routes.dart';

class SplashController extends GetxController {
  var _isLoading = true.obs;
  get isReady => !_isLoading.value;

  SplashController();

  @override
  void onInit() {
    super.onInit();

    //Get for App controller
    var appController = Get.find<AppController>();

    //must run first controller setup
    appController.setup().then((nullvalue) {
      print(appController.runtime);
      appController.updateTheme();
      appController.increaseRuntime().then((value) => toHome());
    });
  }

  toHome() {
    Get.offAllNamed(Routes.HOME);
  }
}
