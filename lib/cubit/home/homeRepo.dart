// HomeRepo

import 'dart:convert';

import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/statisticModel.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/helper/constant/apiUrls.dart';
import 'package:tt_league/helper/localStorage/preference_handler.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

abstract class HomeRepoAbstract {
  Future<ApiResponse<List<UserModel>>> getPlayers();
}

class HomeRepo implements HomeRepoAbstract {
  NetworkRequest networkRequest;

  HomeRepo({required this.networkRequest});

  @override
  Future<ApiResponse<List<UserModel>>> getPlayers() async {

    String id = (await PreferenceHandler.getUserId())!;
    String email = (await PreferenceHandler.getEmail())!;

    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.getPlayers(id, email),
    );
    List<UserModel>? _players;
    if (resp["status"] == "1") {
     List<dynamic> userData = resp['players']  ;
      if (userData.isNotEmpty) {
        _players = List.generate(userData.length, (index) => UserModel
            .fromJson(userData[index]));
      }
      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject: _players);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject: []);
    }
  }
  Future<ApiResponse<String>> getMatchRequest(String opponentId) async {

    String id = (await PreferenceHandler.getUserId())!;

    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.getMatchRequest(id, opponentId),
    );

    if (resp["status"] == "1") {
      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject: resp["returnval"]);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject:resp["returnval"]);
    }
  }

}
