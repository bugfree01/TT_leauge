import 'dart:convert';

import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/statisticModel.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/helper/constant/apiUrls.dart';
import 'package:tt_league/helper/localStorage/preference_handler.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

abstract class EditProfileRepoAbstract {
  Future<ApiResponse<String>> updateUserData({required UserModel userModel});
}

class EditProfileRepo implements EditProfileRepoAbstract {
  NetworkRequest networkRequest;

  EditProfileRepo({required this.networkRequest});

  @override
  Future<ApiResponse<String>> updateUserData(
      {required UserModel userModel}) async {

    String userId = (await PreferenceHandler.getUserId())!;

    Map<String, dynamic> userData = {
      "userid": userId,
      "fullname": userModel.fullname,
      "playerlevel": "Intermediate",
      "playerimage": userModel.playerimage,
      "credits": "50",
      "initialCredits": "50",
      "earnedCredits": "0",
      "emailid": "player1@gmail.com",
      "keycol": userModel.keycol,
      "isActive": "1",
      "creditsreqd": "15",
      "notifyto": userModel.mobile,
      "rating": "5",
      "ranking": "",
      "ratio": "",
      "percentage": "",
      "consentedon": "2021-08-25 00:00:00",
      "consentedon2": null,
      "consentedon3": null,
      "location": userModel.location,
      "description": userModel.description,
      "category": "",
      "equipment": "Tensor on both sides",
      "tshirt":userModel.tshirt,
      "shirtRedeemed": userModel.shirtRedeemed,
      "preflocation": userModel.preflocation,
      "preftime": userModel.preftime,
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
      "age": userModel.age,
      "postalcode": "545086",
      "isAdmin": "0",
      "matches": 0,
      "membertype": "0",
      "hrsavailable": "0",
      "mexpirydate": ""
    };
    Map<String,dynamic> userImages = {
      "playerimage1": userModel.playerimage![0],
      "playerimage2": userModel.playerimage![1],
      "playerimage3": userModel.playerimage![2],
      "playerimage4": userModel.playerimage![3],
      "playerimage5": userModel.playerimage![4],
      "playerimage6": userModel.playerimage![5]
    };


    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.editProfile(jsonEncode(userData),jsonEncode(userImages)),
    );
    if (resp["status"] == "1") {
      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject: resp["message"]);
    } else {
      return ApiResponse(
          isSuccess: false,
          errorCause: resp["message"],
          resObject: resp["message"]);
    }
  }
}
