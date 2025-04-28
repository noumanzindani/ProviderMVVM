import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;
import 'package:app/data/app_exceptions.dart';
import 'package:app/data/network/baseapiservices.dart';
import 'package:http/http.dart';

class Networkapiservices extends Baseapiservices {
  @override
  Future getDeleteApiResponse(String url) async {}

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data,Map<String,String> header) async {
    dynamic responseJson;
    try {
    Response response =
          await http.post(
            Uri.parse(url),
            headers: header,
            body: data);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException(response.body.toString());

      default:
        throw FetchDataException(
            "Error accoured while communicating with server withstatuscode${ response.statusCode}");
    }
  }
}
