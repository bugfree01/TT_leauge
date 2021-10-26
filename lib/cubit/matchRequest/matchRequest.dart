// HomeRepo

import 'dart:convert';

import 'package:tt_league/Model/matchRequestModel.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/statisticModel.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/helper/constant/apiUrls.dart';
import 'package:tt_league/helper/localStorage/preference_handler.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

abstract class MatchRequestRepoAbstract {
  Future<ApiResponse<MatchRequestModel>> getMatchData();
  Future<ApiResponse<String>> matchCancel({required String matchId});
  Future<ApiResponse<String>> matchAccept({required String matchId});
}

class MatchRequestRepo implements MatchRequestRepoAbstract {
  NetworkRequest networkRequest;

  MatchRequestRepo({required this.networkRequest});

  @override
  Future<ApiResponse<MatchRequestModel>> getMatchData() async {

    String id = (await PreferenceHandler.getUserId())!;

    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.matchRequest(id),
    );
    MatchRequestModel _players;
    if (resp["status"] == "1") {
     _players = MatchRequestModel.fromJson(resp);
      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject: _players);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject:null);
    }
  }

  @override
  Future<ApiResponse<String>> matchCancel({required String matchId}) async {

    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.cancelMatch(matchId),
    );
    MatchRequestModel _players;
    if (resp["status"] == "1") {
     _players = MatchRequestModel.fromJson(resp);
      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject:  resp["message"]);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject: resp["message"]);
    }
  }

  @override
  Future<ApiResponse<String>> matchAccept({required String matchId}) async {

    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.matchAccept(matchId),
    );
    MatchRequestModel _players;
    if (resp["status"] == "Accepted") {
     _players = MatchRequestModel.fromJson(resp);
      return ApiResponse(
          isSuccess: (resp["status"] == "Accepted"),
          errorCause: resp["message"],
          resObject:  resp["message"]);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject: resp["message"]);
    }
  }

  Future<ApiResponse<MatchRequestModel>> getPendingMatches() async {

    String id = (await PreferenceHandler.getUserId())!;
    print("Uour useiId is $id");

    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.pendingMatchRequest(id),
    );
    MatchRequestModel _players;
    if (resp["status"] == "1") {
     _players = MatchRequestModel.fromJson(resp);
      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject: _players);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject:null);
    }
  }

  Future<ApiResponse<MatchRequestModel>> getCompletedMatches() async {

    String id = (await PreferenceHandler.getUserId())!;
    print("Uour useiId is $id");

    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.completedMatchRequest(id),
    );
    MatchRequestModel _players;
    if (resp["status"] == "1") {
     _players = MatchRequestModel.fromJson(resp);
      return ApiResponse(
          isSuccess: (resp["status"] == "1"),
          errorCause: resp["message"],
          resObject: _players);
    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject:null);
    }
  }

}
