import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ApiHelper {
  String baseURL = "http://40.87.11.131:3000/";//"http://gambeat.com.ng:8080/";

  static const String GET_CLOSEST_ORPHANAGE = "api/orphanages";

  static const String GET_ALL_GAMES = "api/activity/games/";

  Future<HttpClientResponse> fet(double latitude, double longitude) async {

    HttpClient httpClient = new HttpClient();

    HttpClientRequest request =
    await httpClient.postUrl(Uri.parse(baseURL + GET_CLOSEST_ORPHANAGE +"/"+ latitude.toString() +"/"+ longitude.toString()));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    httpClient.close();

    return response;
  }

}
