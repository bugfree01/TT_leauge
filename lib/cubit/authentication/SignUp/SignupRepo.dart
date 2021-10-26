import 'dart:convert';

import 'package:tt_league/Model/leaderboard.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/helper/constant/apiUrls.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

abstract class RegisterRepoAbstract {
  Future<ApiResponse<LeadrboardModel>> register(UserModel userModel);
}

class SignupRepo implements RegisterRepoAbstract {
  NetworkRequest networkRequest;

  SignupRepo({required this.networkRequest});

  Future<ApiResponse<LeadrboardModel>> register(UserModel userModel) async {
    Map<String, dynamic> createUserData = {
      "userid": "",
      "fullname": userModel.fullname,
      "playerlevel": userModel.playerlevel,
      "playerimage": [],
      "credits": "50",
      "initialCredits": "50",
      "earnedCredits": "0",
      "emailid": userModel.emailid,
      "keycol": userModel.keycol,
      "isActive": "1",
      "creditsreqd": "15",
      "notifyto": userModel.mobile,
      "rating": "5",
      "ranking": "",
      "ratio": "",
      "percentage": "",
      "consentedon": "",
      "consentedon2": null,
      "consentedon3": null,
      "location": "",
      "description": "",
      "category": "",
      "equipment": "",
      "tshirt": "",
      "shirtRedeemed": "0",
      "preflocation": "",
      "preftime": "",
      "partner": null,
      "played": null,
      "wins": 0,
      "schedules": 0,
      "pending": null,
      "requests": 0,
      "goldwins": "0",
      "silverwins": "0",
      "bronzewins": "0",
      "teamid": "0",
      "age": "",
      "postalcode": "",
      "isAdmin": "0",
      "matches": 0,
      "membertype": "0",
      "hrsavailable": "0",
      "mexpirydate": ""
    };
  Map<String,dynamic> userImages = {
    "playerimage1": "",
    "playerimage2": "",
    "playerimage3": "",
    "playerimage4": "",
    "playerimage5": "",
    "playerimage6": ""
  };

    String str = jsonEncode(createUserData);
    String imageStr = jsonEncode(userImages);

    LeadrboardModel? _userModel;
    Map<String, dynamic> resp = await networkRequest.networkCallPost(
        targetURL: ApiUrls.register(str,imageStr));
    if (resp["status"] == "2") {
      Map<String, dynamic> userData = resp['user'] as Map<String, dynamic>;
      if (userData.isNotEmpty) {
        _userModel = LeadrboardModel.fromJson(userData);
      }
      return ApiResponse(
          isSuccess: true, errorCause: resp["message"], resObject: _userModel);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject: null);
    }
  }
}
