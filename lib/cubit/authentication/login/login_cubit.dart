import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/statisticModel.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/cubit/authentication/login/LoginRepo.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/helper/constant/appMessages.dart';
import 'package:tt_league/helper/localStorage/preference_handler.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo = LoginRepo(networkRequest: NetworkRequest());
  late ApiResponse<UserModel> userDetail;

  LoginCubit() : super(LoginInitial());

  void validateFromServer(String userName, String password) async {
    try {
      emit(LoginLoading());
      if (await MethodUtils.isInternetPresent()) {
        if (userName.isEmpty) {
          emit(LoginError(AppMessages.validEmaiId));
        } else if (password.isEmpty) {
          emit(LoginError(AppMessages.validPassword));
        } else {
          userDetail = await loginRepo.validateFromServer(
              password: password, username: userName);
          if (userDetail.isSuccess) {
            await PreferenceHandler.setLogIn(true);
            String userID = userDetail.resObject!.userid!;
            await PreferenceHandler.setUserId(userID);
            await PreferenceHandler.setEmail(userDetail.resObject!.emailid!);
            await PreferenceHandler.setName(userDetail.resObject!.fullname!);
            await PreferenceHandler.setAboutMe(
                userDetail.resObject!.description!);
            await PreferenceHandler.setAge(userDetail.resObject!.age!);
            await PreferenceHandler.setWinPercentage(
                userDetail.resObject!.percentage!);
            await PreferenceHandler.setWins(
                userDetail.resObject!.wins!.toString());
            await PreferenceHandler.setMatches(
                userDetail.resObject!.matches!.toString());
            await PreferenceHandler.setLocation(
                userDetail.resObject!.location!);
            await PreferenceHandler.setGoldWins(
                userDetail.resObject!.goldwins!);
            await PreferenceHandler.setShirt(userDetail.resObject!.tshirt!);
            await PreferenceHandler.setSilverWins(
                userDetail.resObject!.silverwins!);
            await PreferenceHandler.setBronzeWins(
                userDetail.resObject!.bronzewins!);
            await PreferenceHandler.setPalyerLevel(
                userDetail.resObject!.playerlevel!);
            await PreferenceHandler.setShirtRedeem(
                userDetail.resObject!.shirtRedeemed!);
            await PreferenceHandler.setPrefLocation(
                userDetail.resObject!.preflocation!);
            await PreferenceHandler.setPassword(userDetail.resObject!.keycol!);
            await PreferenceHandler.setMobile(userDetail.resObject!.mobile);
            // int length = userDetail.resObject!.playerimage!.length;
            saveImage();
            emit(LoginLoaded(userDetail.errorCause));
          } else {
            emit(LoginError(userDetail.errorCause));
          }
        }
      } else {
        emit(LoginError(AppMessages.getNoInternetMsg));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  void saveImage() async {
    // if(lentgh == 6){
    String image = userDetail.resObject!.image1.split("/").last;
    await PreferenceHandler.setPalyerImage(image);
    await PreferenceHandler.setPalyerImage1(
        userDetail.resObject!.images!.playerimage2!.split("/").last);
    await PreferenceHandler.setPalyerImage2(
        userDetail.resObject!.images!.playerimage3!.split("/").last);
    await PreferenceHandler.setPalyerImage3(
        userDetail.resObject!.images!.playerimage4!.split("/").last);
    await PreferenceHandler.setPalyerImage4(
        userDetail.resObject!.images!.playerimage5!.split("/").last);
    await PreferenceHandler.setPalyerImage5(
        userDetail.resObject!.images!.playerimage6!.split("/").last);
    // } else if(lentgh == 5){
    //   String image =
    //       userDetail.resObject!.playerimage![0].split("/").last;
    //   await PreferenceHandler.setPalyerImage(image);
    //   await PreferenceHandler.setPalyerImage1(
    //       userDetail.resObject!.playerimage![1].toString());
    //   await PreferenceHandler.setPalyerImage2(
    //       userDetail.resObject!.playerimage![2].split("/").last);
    //   await PreferenceHandler.setPalyerImage3(
    //       userDetail.resObject!.playerimage![3].split("/").last);
    //   await PreferenceHandler.setPalyerImage4(
    //       userDetail.resObject!.playerimage![4].split("/").last);
    //
    // }else if(lentgh == 4){
    //   String image =
    //       userDetail.resObject!.playerimage![0].split("/").last;
    //   await PreferenceHandler.setPalyerImage(image);
    //   await PreferenceHandler.setPalyerImage1(
    //       userDetail.resObject!.playerimage![1].toString());
    //   await PreferenceHandler.setPalyerImage2(
    //       userDetail.resObject!.playerimage![2].split("/").last);
    //   await PreferenceHandler.setPalyerImage3(
    //       userDetail.resObject!.playerimage![3].split("/").last);
    //
    // }else if(lentgh == 3){
    //   String image =
    //       userDetail.resObject!.playerimage![0].split("/").last;
    //   await PreferenceHandler.setPalyerImage(image);
    //   await PreferenceHandler.setPalyerImage1(
    //       userDetail.resObject!.playerimage![1].toString());
    //   await PreferenceHandler.setPalyerImage2(
    //       userDetail.resObject!.playerimage![2].split("/").last);
    //
    //
    // }else if(lentgh == 2){
    //   String image =
    //       userDetail.resObject!.playerimage![0].split("/").last;
    //   await PreferenceHandler.setPalyerImage(image);
    //   await PreferenceHandler.setPalyerImage1(
    //       userDetail.resObject!.playerimage![1].toString());
    //
    // }
    // else if(lentgh == 1){
    //   String image =
    //       userDetail.resObject!.playerimage![0].split("/").last;
    //   await PreferenceHandler.setPalyerImage(image);
    //
    // }
  }

  void getStatistic() async {
    try {
      emit(LoginInitial());
      if (await MethodUtils.isInternetPresent()) {
        ApiResponse<StatisticModel> apiResponse =
            await loginRepo.getStatisticData();
        if (apiResponse.isSuccess) {
          emit(LoginStatisticLoaded(apiResponse.resObject!));
        } else {
          emit(LoginError(apiResponse.errorCause));
        }
      } else {
        emit(LoginError(AppMessages.getNoInternetMsg));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
