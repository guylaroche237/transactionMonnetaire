import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:moneytrans/infrastructure/abstract_types/api/abstract_api_client.dart';
import 'package:moneytrans/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:moneytrans/infrastructure/abstract_types/api/abstract_api_response.dart';

import 'api_response.dart';
import 'errors/generic_error.dart';

class ApiClient implements AbstractApiClient {
  final String host =  "api.exchangeratesapi.io";
  final String prefix = "";
  static ApiClient _instance;

  @override
  Future<AbstractApiResponse> process(AbstractApiRequest request) async {

    final url = _makeUrl(request);
    print(url.toString());
    switch (request.getVerb()) {
      case "GET":
        Map<String, String> headers = <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }..addAll(request.getAdditionnalHeaders());
        Response response = await http.get(url.toString(), headers: headers);
        return ApiResponse(response);
    }
    return ApiResponse(null,
        defaultError: GenericError(
            "the request ${request.getName()} has invalid HTTP Verb"));
  }

  Uri _makeUrl(AbstractApiRequest request) {
    return Uri.http(this.host, this.prefix + request.getUrl(), request.getParams());
  //  return Uri.https(this.host, this.prefix + request.getUrl(), request.getParams());
  }

  static Future<AbstractApiResponse> exec(AbstractApiRequest request) async {
    if (_instance == null) {
      _instance = ApiClient();
    }
    return await _instance.process(request);
  }

  static Future<AbstractApiResponse> execOrFail(
      AbstractApiRequest request) async {
    try {
      ApiResponse response = await exec(request);
      if (response.hasError()) {
        print(response.error.toString());
        print(response.error.stackTrace);
        throw response.error;
      }
      return response;
    } catch (err) {
      print(err.toString());
      print(err.stackTrace);
      throw err;
    }
  }

  static Future<dynamic> execAndParseOrFail(AbstractApiRequest request) async {
    ApiResponse response = await ApiClient.execOrFail(request);
    print(response.httpResponse.body);
    return request.parseResult(response);
  }
}
