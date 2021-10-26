import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_league/Model/leaderboard.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/cubit/leaderboard/leaderboardRepo.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/helper/constant/appMessages.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

part 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderboardRepo leaderboardRepo = LeaderboardRepo(networkRequest:
  NetworkRequest());

  LeaderboardCubit() : super(LeaderboardInitial());

  void getplayersData(String category) async {
    try {
      emit(LeaderboardInitial());
      if (await MethodUtils.isInternetPresent()) {
        ApiResponse<List<LeadrboardModel>> apiResponse = await leaderboardRepo
            .getPalyers(category: category);
        if (apiResponse.isSuccess) {
          emit(LeaderboardLoaded(apiResponse.resObject!));
        } else {
          emit(LeaderboardError(apiResponse.errorCause));
        }
      } else {
        emit(LeaderboardError(AppMessages.getNoInternetMsg));
      }
    } catch (e) {
      emit(LeaderboardError(e.toString()));
    }
  }
}
