import 'dart:convert';

import 'package:moneytrans/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:moneytrans/infrastructure/abstract_types/api/abstract_api_response.dart';

class ConvertAmountRequest extends AbstractApiRequest{
 final String symbolFrom;
 final String symbolTo;
 final double amount;

  ConvertAmountRequest(this.symbolFrom, this.symbolTo, this.amount);
  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/v1/convert";
  }

  @override
  Map<String, String> getParams() {
    // TODO: implement getParams
    return {"access_key":"c37123b7614074a6f50d68ad704ce555","from":symbolFrom,"to":symbolTo,"amount":amount.toString()};
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "GET";
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    return jsonDecode(response.httpResponse.body);

  }

}