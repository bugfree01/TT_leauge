import 'package:flutter/foundation.dart';

class AppInfo {
  static const String companyName = "Talouns PTE LTD";
  static const String companyAddress = "";
  static const String appName = "TT League";
  static const String appVersion = "1.0.0";
  static const String appVersionDisplay = "20210809";
  static const String allRightReserved =
      "© 2020 \n  \nAll Rights Reserved.";

  static const String _ANDROID = "ANDROID";
  static const String _IOS = "IOS";

  static String getPlatform() =>
      defaultTargetPlatform == TargetPlatform.android ? _ANDROID : _IOS;
}
