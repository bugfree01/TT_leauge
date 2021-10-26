
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/helper/constant/apiUrls.dart';
import 'package:tt_league/helper/localStorage/preference_handler.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

abstract class SearchRepoAbstract {

}

class SearchRepo extends SearchRepoAbstract {
  NetworkRequest networkRequest;

  SearchRepo(this.networkRequest);

  Future<ApiResponse<List<UserModel>>> getPlayers(String keyword,String filter) async {

    String id = (await PreferenceHandler.getUserId())!;
    String email = (await PreferenceHandler.getEmail())!;

    Map<String, dynamic> resp = await networkRequest.networkCallPostMap(
      ApiUrls.getPlayersWithSearch(id, email,keyword,filter),
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
}
