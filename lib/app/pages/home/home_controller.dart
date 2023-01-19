import 'package:get/get.dart';
import 'package:tpsgetx3/app/controllers/xrate_controller.dart';
import 'package:tpsgetx3/app/data/model/model.dart';
import 'package:tpsgetx3/app/data/repository/repository.dart';
import 'package:tpsgetx3/app/controllers/user_controller.dart';
import 'package:tpsgetx3/app/routes/app_routes.dart';

class HomeController extends GetxController {
  //Initialised properties  --------------------------------------
  final Repository repository;

  HomeController({required this.repository});

  //Static --------------------------------------------------------NONE

  //Public  -------------------------------------------------------NONE
  Rate? rate;
  //Private -------------------------------------------------------

  final _isLoading = false.obs;
  final _searchMode = false.obs;
  final _userController = Get.find<UserController>();
  final _exchangeCurrency = 'USD'.obs;
  final _exchangeCurrencyAmount = 0.0.obs;
  final _myanmarCurrencyAmount = 0.0.obs;
  final _updateRatesStatus = '⏬Pull down to update latest exchange rates⏬'.obs;

  //Getters
  get isLoading => _isLoading.value;
  get searchMode => _searchMode.value;
  get exchangeCurrency => _exchangeCurrency.value;
  get exchangeCurrencyAmount => _exchangeCurrencyAmount.value;
  get myanmarCurrencyAmount => _myanmarCurrencyAmount.value;
  get updateRatesStatus => _updateRatesStatus.value;

  //Setters -------------------------------------------------------
  set isLoading(value) => _isLoading.value = value;
  set searchMode(value) => _searchMode.value = value;
  set exchangeCurrency(value) => _exchangeCurrency.value = value;
  set exchangeCurrencyAmount(value) => _exchangeCurrencyAmount.value = value;
  set myanmarCurrencyAmount(value) => _myanmarCurrencyAmount.value = value;
  set updateRatesStatus(value) => _updateRatesStatus.value = value;

  XRateController rateCtrl = Get.put(XRateController());
  @override
  onInit() {
    super.onInit();
    isLoading = true;
    //Controller Initialization
    _fetchRate();
  }

  //Public Methods ( Functions) -----------------------------------
  changeSearchMode() {
    searchMode = !searchMode;
  }

  changeExchangeCurrency(String currency) {
    exchangeCurrency = currency;
  }

  exchange(double mmkAmount) {
    myanmarCurrencyAmount = mmkAmount;
    final exchangeRate = double.parse(
        rate!.rates[exchangeCurrency].replaceAll(',', '') as String);
    exchangeCurrencyAmount = myanmarCurrencyAmount / exchangeRate;
  }

  Future<void> updateExchangeRates() async {
    _fetchRate();
    String timestampString = rate!.timeStampString!;
    int timestampInt = int.parse(timestampString);
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestampInt * 1000);
    String dateString = date.toString().split(' ')[0];
    updateRatesStatus = '✅Updated exchange rates $dateString✅';
  }

  //Private Methods ( used internally ) ---------------------------
  _fetchRate() async {
    var rate = await rateCtrl.getRates();
    if (rate != null) {
      print("Got the rate");
      print(rate);
      this.rate = rate;
    } else {
      print("Sorry no the rate");
    }
    isLoading = false;
  }
  //Public Methods  ( Routing : start with to) --------------------

  toDetails({Function()? then}) {
    //may pass value to used in arguments
    Get.toNamed(Routes.DETAILS, arguments: null)?.then((value) {});
  }

  toOthers() {
    Get.toNamed(Routes.OTHERS);
  }
}
