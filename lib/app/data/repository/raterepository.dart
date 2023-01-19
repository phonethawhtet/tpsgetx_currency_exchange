import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:tpsgetx3/app/data/model/model.dart';
import 'package:tpsgetx3/app/data/model/result.dart';
import 'package:tpsgetx3/app/data/provider/api.dart';

class RateRepository {
  //This is dummy repository
  APIService _apiService = APIService();
  RateRepository();

  Future<Result> getRates() async {
    //Decide where to fetch data : Local DB manager or API
    var _path = "/api/latest";
    var params = {};
    try {
      final response = await _apiService.request(
        requestType: RequestType.GET,
        path: _path,
        // parameter: params,
        header: {
          HttpHeaders.acceptHeader: 'application/json',
          // HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      
      final responseJSON = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var rate = Rate.fromJson(responseJSON);
        return Result<Rate>.success(rate);
      } else {
        var message = responseJSON["message"];
        // var message = "Getting Issue Order Failed";
        return Result.error(message);
      }
    } catch (error) {
      return Result.error("Error");
    }
  }
}
