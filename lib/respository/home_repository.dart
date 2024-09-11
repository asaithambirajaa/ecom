import 'dart:convert';

import '../data/remote/network/BaseApiService.dart';
import '../data/remote/network/NetworkApiService.dart';

import '../models/home_banner_model.dart';
import '../res/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<HomeBannerModel> fetchBannerList() async {
    Map requestData = {
      "FetchLimit": 25,
      "LastIndex": 0,
      "EventType": "",
      "Dealer": "",
      "Pincode": "600001"
    };

    try {
      // dynamic response = await _apiServices.getPostApiResponse(
      //     AppUrl.bannerListEndPoint, requestData);
      Map<String, dynamic> json = {
        "Status_Code": "200",
        "Status_Description": "Data Fetched Successfully.",
        "Result": [
          "[{\"Pk_Id\":33592,\"Category\":\"GROCERY\",\"Brand\":\"BRU\",\"Model\":\"COFFEE\",\"MakeYear\":null,\"StartingPrice\":\"150.00\",\"CurrentPrice\":\"145.00\",\"Dealer\":\"NOVACJS4\",\"VehicleRegNO\":\"BRU1001\",\"Variant\":\"500GRMS \",\"Mileage\":5.00,\"FuelType\":\"-\",\"ImagePath\":\"Y2022\\\\M9\\\\D5\\\\15-24-38-5951\",\"Status\":\"LIVE\",\"Plcode\":\"DS/2022/32\",\"CartVisibility\":\"True\",\"Lotno\":1,\"Buynow\":null,\"Buynowprice\":null,\"DisplayOrder\":4,\"CugEventType\":\"D\",\"FeatureMarked\":\"No \",\"PrioritySequence\":1,\"HighlightedVehicle\":\"No \",\"FeatureVehicle\":null,\"AdminMarkedSeqNo\":null,\"KYCStatus\":null,\"KYCFlag\":null,\"EndTime\":\"05/09/2023 11:18:00 PM\",\"CertifiedVehicle\":\"Yes\",\"ShowRegNo\":\"Yes\",\"currTime\":\"20/09/2022 04:54:14 PM\",\"Stock\":260,\"displayremarks\":\"\",\"remainingcount\":0,\"extradiscount\":0,\"additionaldiscountflag\":\"N\",\"Quantity\":0,\"VehType\":\"V\",\"Stockmultiplier\":5,\"SMstartprice\":750,\"SMsaleprice\":725,\"SMoffervalue\":25,\"MaxQuantity\":20,\"Savelater\":\"N\"}]",
          "[{\"CartCount\":0}]",
          "[{\"TotalPages\":1,\"Total\":1}]",
          "[]",
          "[]"
        ]
      };

      var resultList = json['Result'] as List;
      var resultList1 = jsonDecode(resultList[0]);
      print(resultList1);
      var rr = resultList1[0]['Pk_Id'];
      print(rr);
      return HomeBannerModel();
      //return json = HomeBannerModel.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
