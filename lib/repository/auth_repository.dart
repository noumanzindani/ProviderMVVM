import 'package:app/data/network/baseapiservices.dart';
import 'package:app/data/network/networkapiservices.dart';
import 'package:app/res/components/app_url.dart';

class AuthRepository {
   Baseapiservices _apiServices = Networkapiservices();

  Future<dynamic> loginApi(dynamic data,dynamic header,) async {
    try {
      dynamic reponse =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data,header);
      return reponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> regsterApi(dynamic data,Map<String,String> header,) async {
    try {
      dynamic reponse =
          await _apiServices.getPostApiResponse(AppUrl.registerUrl, data,header);
      return reponse;
    } catch (e) {
      rethrow;
    }
  }
}
