import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import '../data/repository/repository.dart';
import '../pages/sidemenu/sidemenu_controller.dart';
import '../pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SidemenuController());

    Get.lazyPut<HomeController>(() {
      return HomeController(repository: Repository());
    });
  }
}
