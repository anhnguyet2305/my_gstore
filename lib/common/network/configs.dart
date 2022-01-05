import 'dart:io';

class Configurations {
  static String host = 'http://devapi.gstore.social/';

  /// remove this when clear data
  static const String hostImageOld = 'http://image.gstore.social/Originals/';

  static const String hostImage = 'http://image.gstore.social/Larges/';

  static const int connectTimeout = 30; // second
  static const double maxKm = 25.0; // km
  static const int maxKmInt = 25; // km
  static const int pageSize = 12;
}
