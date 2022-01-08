
import 'package:my_gstore/common/enum.dart';
import 'package:my_gstore/common/ultils/common_util.dart';

class BannerModel {
  String? pictureUrl;
  int? iD;
  int? type;
  String? link;
  int? linkConverted;
  DateTime? dateEnd;

  BannerModel.fromJson(Map<String, dynamic> json) {
    pictureUrl = CommonUtils.getUrlImage(
      json['PictureUrl'],
      typeImage: TypeSizeImage.origin,
      oldUrl: true,
    );
    iD = json['ID'];
    type = json['Type'];
    link = json['Link'];
    dateEnd = json['DateEnd'] != null
        ? CommonUtils.convertDateTime(json['DateEnd'], outputDateTime: true)
        : null;
    try {
      linkConverted = int.parse(link ?? '');
    } catch (e) {}
  }
}
