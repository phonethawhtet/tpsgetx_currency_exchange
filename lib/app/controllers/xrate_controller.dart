import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:tpsgetx3/app/data/model/result.dart';
import 'package:tpsgetx3/app/data/repository/raterepository.dart';
import 'package:tpsgetx3/app/data/repository/repository.dart';
import '../data/model/model.dart';

class XRateController extends GetxController {
  //Initialised properties  --------------------------------------
  RateRepository _rateRepository = RateRepository();
  XRateController();

  //Static --------------------------------------------------------NONE

  //Public  -------------------------------------------------------NONE

  //Private -------------------------------------------------------
  var _isLoading = false.obs;

  //Getters
  get isLoading => _isLoading.value;

  //Setters -------------------------------------------------------

  onInit() {
    super.onInit();

    //Controller Initialization
  }

  //Public Methods ( Functions) -----------------------------------
  Future<Rate?> getRates() async {
    Rate? rate;
    var result = await _rateRepository.getRates();
    debugPrint('$rate');
    if (result is SuccessState) {
      var rate = result.value;
      return rate;
      //Fetch user information again

    } else if (result is ErrorState) {
      _isLoading.value = false;
      return rate;
    } else if (result is LoadingState) {
      _isLoading.value = true;
    }
    return rate;
  }

  //Private Methods ( used internally ) ---------------------------
  Future<void> _dosomethingPrivate(Model word) async {
    return;
  }

  //Non Paged Controller has NO Routing methods usually
  //Public Methods  ( Routing : start with to) -------------------- NONE

}
