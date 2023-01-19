import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:tpsgetx3/app/controllers/app_controller.dart';
import 'package:tpsgetx3/app/data/repository/appstate_repository.dart';
import '../data/repository/repository.dart';
import 'package:tpsgetx3/app/pages/home/home_controller.dart';
import 'package:tpsgetx3/app/pages/sidemenu/sidemenu_controller.dart';
import '../controllers/user_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    //Load all prerequested controllers/non-page controller here
    var repository = Repository();
    Get.put(AppController(repository: AppStateRepository()));
    Get.put(UserController(repository: repository)); //Pass respective repo
    Get.put(HomeController(repository: repository));
    Get.put(SidemenuController());
  }
}
