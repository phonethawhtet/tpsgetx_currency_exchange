import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum RequestType { GET, POST, DELETE }

class RequestTypeNotFoundException implements Exception {
  String cause;
  RequestTypeNotFoundException(this.cause);
}

Map<String, dynamic> _rate = {
  "info": "Central Bank of Myanmar",
  "description": "Official Website of Central Bank of Myanmar",
  "timestamp": "1673856000",
  "rates": {
    "USD": "2,100.0",
    "SGD": "1,590.5",
    "IDR": "13.958",
    "KHR": "51.157",
    "LKR": "5.7377",
    "NZD": "1,341.6",
    "CZK": "94.652",
    "JPY": "1,636.3",
    "KRW": "169.86",
    "VND": "8.9610",
    "PHP": "38.454",
    "HKD": "268.88",
    "BRL": "412.11",
    "RSD": "19.363",
    "MYR": "486.56",
    "GBP": "2,562.2",
    "CAD": "1,568.0",
    "SEK": "201.52",
    "NOK": "212.18",
    "ILS": "613.86",
    "DKK": "305.47",
    "AUD": "1,462.4",
    "RUB": "30.695",
    "KWD": "6,877.1",
    "INR": "25.724",
    "BND": "1,590.5",
    "EUR": "2,272.6",
    "ZAR": "123.01",
    "NPR": "16.077",
    "CNY": "312.08",
    "CHF": "2,272.4",
    "THB": "63.675",
    "PKR": "9.1800",
    "KES": "16.949",
    "EGP": "71.150",
    "BDT": "19.718",
    "SAR": "559.08",
    "LAK": "12.450"
  }
};

class APIService {
  final String _baseURL = "forex.cbm.gov.mm";

  Future<Response> request(
      {required RequestType requestType,
      required String path,
      dynamic parameter,
      Map<String, String>? header,
      dynamic body}) async {
    switch (requestType) {
      case RequestType.GET:
        return http
            .get(Uri.parse(Uri.https(_baseURL, path, parameter).toString()), headers: header)
            .timeout(
          Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('{"error": "Time out error"}',
                500); // Replace 500 with your http code.
          },
        );
        // return http.get(Uri.parse('https://forex.cbm.gov.mm/api/latest'), headers: header);
        break;
      case RequestType.POST:
        return http
            .post(Uri.https(_baseURL, path, parameter),
                headers: header, body: body)
            .timeout(
          Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('{"error": "Time out error"}',
                500); // Replace 500 with your http code.
          },
        );
        break;

      case RequestType.DELETE:
        return http.delete(Uri.https(_baseURL, path), headers: header).timeout(
          Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('{"error": "Time out error"}',
                500); // Replace 500 with your http code.
          },
        );
      default:
        return throw RequestTypeNotFoundException(
            "The HTTP request mentioned is not found");
    }
  }
}

//   static Future fetchLocalJsonData() async {
//     await Future.delayed(Duration(seconds: 3));

//     return jsonDecode(transactionData) as Map<String, dynamic>;
//   }
//   //Public functions
//   Future<Result> getNewsFeed() async {
//     final String _path = "/app/v1/news";
//     final Map<String, String> _params = null;

//     var _result = Result();

//     try {
//       print("Fetching newsfeed...");
//       Map<String, dynamic> headers = _getHeader(temptoken);
//       Uri uri = new Uri.http(APIBASEURL, _path, _params);

//       var response = await http.get(uri, headers: headers);
//       var returnJSON = jsonDecode(response.body);

//       // // ignore: close_sinks
//       // var response = await CasedHttp.get(uri, headers: headers);
//       // var body = await response.body;
//       // var returnJSON = jsonDecode(body);

//       if (response.statusCode == 200) {
//         _result.object = returnJSON["news"];
//         //modify desired object to return as array/map (Only JSON)
//         return _result; //***
//       }

//       //Error Return from server
//       _result.error = "Error";
//       _result.message =
//           returnJSON["message"]; //Add actual error message from server
//       return _result;
//     } catch (error) {
//       //Default error
//       print(error);
//       _result.error = "Error";
//       _result.message = "Failed to get newsfeed"; //Default message
//       return _result;
//     }
//   }
// }

// //Private functions
// Map<String, String> _getHeader([String tokenString]) {
//   return {
//     "Accept": 'application/json',
//     "Content-Type": 'application/json',

//     //Server side must enable those facts
//     //"Access-Control-Allow-Origin": "*", // Required for CORS support to work
//     // "Access-Control-Allow-Credentials":
//     //     "true", // Required for cookies, authorization headers with HTTPS

//     // "Access-Control-Allow-Headers":
//     //     "X-Requested-With,Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//     // "Access-Control-Allow-Methods": "GET,HEAD,POST, OPTIONS",
//     "Toinpdag": tokenString ?? temptoken,
//   };
// }
