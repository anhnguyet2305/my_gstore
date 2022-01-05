
class AppPosition {
  double latitude = 0;
  double longitude = 0;

  AppPosition({this.latitude = 0, this.longitude = 0});

  AppPosition.fromJson(Map<String, dynamic> data) {
    latitude = data['latitude'];
    longitude = data['longitude'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
