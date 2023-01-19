import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import '../data/repository/repository.dart';
import '../pages/sidemenu/sidemenu_controller.dart';
import '../pages/home/home_controller.dart';

//Not calling as sidemneu route is navigated as a page eg. to(Routes.sidemenu)
class SideMenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SidemenuController>(() {
      return SidemenuController();
    });
  }
}
