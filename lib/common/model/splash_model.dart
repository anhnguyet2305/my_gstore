import 'package:my_gstore/common/model/banner_model.dart';
import 'package:my_gstore/common/model/profile_model.dart';
import 'package:my_gstore/common/model/version_model.dart';

class SplashDataModel {
  final ProfileModel? profileModel;
  final List<BannerModel>? bannerPopUp;
  final List<BannerModel>? bannerHome1;
  final SplashCharityDataModel? splashCharityDataModel;
  final SplashBonusGSTModel? splashBonusGSTModel;
  final VersionAppModel? versionAppModel;

  SplashDataModel({
    this.profileModel,
    this.bannerPopUp,
    this.bannerHome1,
    this.splashCharityDataModel,
    this.splashBonusGSTModel,
    this.versionAppModel,
  });
}

class SplashCharityDataModel {
  double? total;
  double? gStoreValue;
  String? gStorePercent;
  double? customerValue;
  String? customerPercent;

  SplashCharityDataModel.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    gStoreValue = json['GStoreValue'];
    gStorePercent = json['GStorePercent'];
    customerValue = json['CustomerValue'];
    customerPercent = json['CustomerPercent'];
  }
}

class SplashBonusGSTModel {
  double? total;
  double? currentValue;
  double? percentVolume;

  SplashBonusGSTModel.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    currentValue = json['CurrentValue'];
    percentVolume = json['PercentVolume'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['CurrentValue'] = this.currentValue;
    data['PercentVolume'] = this.percentVolume;
    return data;
  }
}
