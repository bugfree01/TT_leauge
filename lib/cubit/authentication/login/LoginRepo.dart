import 'dart:convert';

import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/statisticModel.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/helper/constant/apiUrls.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

abstract class LoginRepoAbstract {
  Future<ApiResponse<UserModel>> validateFromServer(
      {required String username, required String password});
}

class LoginRepo implements LoginRepoAbstract {
  NetworkRequest networkRequest;

  LoginRepo({required this.networkRequest});

  @override
  Future<ApiResponse<UserModel>> validateFromServer(
      {required String username, required String password}) async {
    Map<String, String> loginMap = {
      "user_name": username,
      "password": password,
    };
    print("your complete usrl is ${ApiUrls.login(username, password)}");
    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.login(username, password),
    );
    UserModel? _userModel;
    if (resp["status"] == "1") {
      Map<String,dynamic> userData = resp['user'] as Map<String,dynamic>;
      Map<String,dynamic> userimages = resp['images'] as Map<String,dynamic>;
      if (userData.isNotEmpty) {
        _userModel = UserModel.fromJson(userData);
      }
      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject: _userModel);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject: null);
    }
  }

  Future<ApiResponse<StatisticModel>> getStatisticData() async {
    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.getStatistic(),
    );

    StatisticModel? _data;
    if (resp["status"] == "1") {
      _data = StatisticModel(
        requests: resp["requests"],
        table: resp["table"],
        teams: resp["teams"],
        tournaments: resp["tournaments"],
        users: resp["users"],
      );

    //   "table": "ALL",
    // "status": "1",
    // "message": "Successfully !",
    // "users": "630",
    // "teams": "29",
    // "tournaments": "8",
    // "requests": "1373"

      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject: _data);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject: null);
    }
  }
}
