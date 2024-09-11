class HomeBannerModel {
  String? statusCode;
  String? statusDescription;
  List<String>? result;

  HomeBannerModel({this.statusCode, this.statusDescription, this.result});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['Status_Code'];
    statusDescription = json['Status_Description'];
    result = json['Result'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status_Code'] = this.statusCode;
    data['Status_Description'] = this.statusDescription;
    data['Result'] = this.result;
    return data;
  }
}