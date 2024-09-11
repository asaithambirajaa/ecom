import 'package:cart_app/models/home_banner_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:cart_app/data/remote/response/ApiResponse.dart';

import 'package:cart_app/respository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<HomeBannerModel> bannerList = ApiResponse.loading();

  setBannerList(ApiResponse<HomeBannerModel> response) {
    bannerList = response;
    notifyListeners();
  }

  Future<void> fetchBannerListApi() async {
    setBannerList(ApiResponse.loading());

    _myRepo.fetchBannerList().then((value) {
      setBannerList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setBannerList(ApiResponse.error(error.toString()));
    });
  }

  
}
