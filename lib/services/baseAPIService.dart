import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'dart:convert';
import 'package:goalpost/utilities/apiKey.dart';

class BaseAPIHelper {
  static final String _baseURL = "api-football-v1.p.rapidapi.com";
  static final String _apiKey =
      footballApiKey;
  static Future<dynamic> get(String url, Map<String,dynamic>? queryParams) async {
    http.Response? response;
    var jsonResponse;
    try {
      print("Forming query");
      var uri=Uri.https(_baseURL, url, queryParams); 
      print("Sending query 2");
      response = await http.get(uri, headers: {
        "x-rapidapi-key": _apiKey,
        "x-rapidapi-host": "api-football-v1.p.rapidapi.com",
      });
      print("Got Response 2");
      jsonResponse = getJsonFromResponse(response);
      
    } on SocketException {
      print('No Connection');
    }
    showWarning('Requests remaining for the day: '+response!.headers['x-ratelimit-requests-remaining']!);
    return jsonResponse['response'];
  }


  static dynamic getJsonFromResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      default:
        print("No result: "+response.statusCode.toString());
        return null;
    }
  }
}
