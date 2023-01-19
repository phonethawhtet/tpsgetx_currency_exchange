import 'package:get/get.dart';
import 'package:tpsgetx3/app/data/repository/appstate_repository.dart';
import 'package:tpsgetx3/app/pages/settings/setting_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() {
      return SettingsController(repository: AppStateRepository());
    });
  }
}
