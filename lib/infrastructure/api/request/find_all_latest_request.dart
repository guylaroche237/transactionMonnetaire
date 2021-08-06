import 'dart:convert';

import 'package:moneytrans/domain/model/latest.dart';
import 'package:moneytrans/infrastructure/abstract_types/api/abstract_api_client.dart';
import 'package:moneytrans/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:moneytrans/infrastructure/abstract_types/api/abstract_api_response.dart';

class FindAllLatestRequest extends AbstractApiRequest{
  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/v1/latest";
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "GET";
  }

  @override
  Map<String, String> getParams() {
    // TODO: implement getParams
    return {"access_key":"c37123b7614074a6f50d68ad704ce555"};
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    return Latest.fromJson(jsonDecode(response.httpResponse.body));

  }

}