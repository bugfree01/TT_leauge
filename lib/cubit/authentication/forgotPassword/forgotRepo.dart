import 'dart:convert';

import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/statisticModel.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/helper/constant/apiUrls.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

abstract class ForgotPasswordRepoAbstract {
  Future<ApiResponse<String>> validateFromServer(
      {required String username, required String password});
}

class ForgotPasswordRepo implements ForgotPasswordRepoAbstract {
  NetworkRequest networkRequest;

  ForgotPasswordRepo({required this.networkRequest});

  @override
  Future<ApiResponse<String>> validateFromServer(
      {required String username, required String password}) async {

    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.forgotPassword(username, password),
    );
    if (resp["status"] == "1") {
      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject: resp["message"]);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject: resp["message"]);
    }
  }

}
