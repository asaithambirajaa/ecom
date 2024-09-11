import 'package:cart_app/flovers.dart';

class AppUrl {
  static var baseUrl = FlavorConfig.instance!.values!.baseUrl;

  static var moviesBaseUrl =
      'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/';

  static var loginEndPint = '$baseUrl/api/login';

  static var registerApiEndPoint = '$baseUrl/api/register';

  static var moviesListEndPoint = '${moviesBaseUrl}movies_list';
  static var uatEndPoint = 'UATQ2SService/';
  static var bannerListEndPoint =
      '$baseUrl${uatEndPoint}DealerStoreService.svc/Dealoftheday';
  static var generateTokenEndPoint =
      '$baseUrl${uatEndPoint}DealerStoreService.svc/GenerateToken';
}
