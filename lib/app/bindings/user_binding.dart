import 'package:get/get.dart';
import 'package:tpsgetx3/app/data/repository/repository.dart';
import '../controllers/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() {
      return UserController(repository: Repository());
    });
  }
}
