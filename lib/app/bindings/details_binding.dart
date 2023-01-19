import 'package:get/get.dart';
import '../pages/details/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController();
    });
  }
}
