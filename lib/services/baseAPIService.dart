import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'dart:convert';
import 'package:goalpost/utilities/apiKey.dart';

class BaseAPIHelper {
  static final String _baseURL = "https://api-football-v1.p.rapidapi.com";
  static final String _apiKey =
      footballApiKey;
  static Future<dynamic> get(String url) async {
    http.Response? response;
    var jsonResponse;
   // var request = Uri.parse(_baseURL+url);
    try {
      response = await http.get(Uri.parse(_baseURL+url), headers: {
        "x-rapidapi-key": _apiKey,
        "x-rapidapi-host": "api-football-v1.p.rapidapi.com",
      });
      jsonResponse = getJsonFromResponse(response);
      
    } on SocketException {
      print('No Connection');
    }
    showError('Requests remaining for the day: '+response!.headers['x-ratelimit-requests-remaining']!);
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
