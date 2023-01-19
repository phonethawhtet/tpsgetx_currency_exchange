import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../controllers/theme_controller.dart';
import '../../data/model/model.dart'; //TODO: Replace with project models

class DetailsController extends GetxController {
  //Initialised properties  --------------------------------------
  Rx<Model> _model =
      Model().obs; //TODO: Replace with respective project models instance
  DetailsController();

  //Static --------------------------------------------------------NONE

  //Public  -------------------------------------------------------NONE

  //Private -------------------------------------------------------
  var _isLoading = false.obs;
  final _themeCtrl = Get.find<ThemeController>();

  //Getters
  Model get model => _model.value;
  get isLoading => _isLoading.value;
  get activeTheme => _themeCtrl.activeTheme;

  //Setters -------------------------------------------------------
  set model(value) => this._model.value = value;

  onInit() {
    super.onInit();
    //Controller Initialization
  }

  //Public Methods ( Functions) -----------------------------------

  //Private Methods ( used internally ) ---------------------------

  //Public Methods  ( Routing : start with to) -------------------- NONE
  toImageDetail() {
    Get.toNamed(Routes.IMAGEDETAILS);
  }
}
