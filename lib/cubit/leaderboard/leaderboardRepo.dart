import 'dart:convert';

import 'package:tt_league/Model/leaderboard.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/helper/constant/apiUrls.dart';
import 'package:tt_league/helper/localStorage/preference_handler.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

abstract class LeaderboardRepoAbstract {
  Future<ApiResponse<List<LeadrboardModel>>> getPalyers({required String category});
}

class LeaderboardRepo implements LeaderboardRepoAbstract {
  NetworkRequest networkRequest;

  LeaderboardRepo({required this.networkRequest});

  @override
  Future<ApiResponse<List<LeadrboardModel>>> getPalyers(
      {required String category}) async {
    String userID = (await PreferenceHandler.getUserId())!;
    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.getLeaderBoard(category,userID),
    );
    List<LeadrboardModel>? _players;
    if (resp["status"] == "1") {
      List<dynamic> playersData = resp["players"] as List<dynamic>;

      if (playersData.isNotEmpty) {
        _players = List.generate(playersData.length,
            (index) => LeadrboardModel.fromJson(playersData[index]));
        return ApiResponse(
            isSuccess: (resp["status"] == "1"),
            errorCause: resp["message"],
            resObject: _players);
      }else{
        return ApiResponse(
            isSuccess: (resp["status"] == "1"),
            errorCause: resp["message"],
            resObject: []);
      }

    } else {
      return ApiResponse(
          isSuccess: false, errorCause: resp["message"], resObject: []);
    }
  }
}
