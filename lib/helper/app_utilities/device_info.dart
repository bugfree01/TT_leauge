//import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeviceInfo {
  static isDeviceIOS() => defaultTargetPlatform == TargetPlatform.iOS;

  static useMobileLayout(BuildContext context) => MediaQuery.of(context).size.shortestSide < 600;

  static useLayoutNormal(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide > 320 && MediaQuery.of(context).size.shortestSide < 600;

  static useLayoutExtraSmall(BuildContext context) => MediaQuery.of(context)
      .size.shortestSide <= 320;

  static useLayoutMiddle(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide > 420 && MediaQuery.of
        (context).size.shortestSide < 500;

  static getDeviceIMEI() async => "123456789";

  static String getDeviceType() => isDeviceIOS() ? "IOS" : "ANDROID";

  static getDeviceName() => "";

/* static getDeviceName() async {
    String receivedDeviceName;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (isDeviceIOS()) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      receivedDeviceName = iosInfo.utsname.machine;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      receivedDeviceName = "${androidInfo.brand} : ${androidInfo.device} ";
    }
    print('[ Running on Device : ${receivedDeviceName} ]');
    return receivedDeviceName;
  }*/
}
