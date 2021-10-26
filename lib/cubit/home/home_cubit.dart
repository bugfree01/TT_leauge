import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/cubit/home/homeRepo.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/helper/constant/appMessages.dart';
import 'package:tt_league/network_configs/networkRequest.dart';
import 'package:tt_league/screen/customWidget/dailog/matchRequest.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo = HomeRepo(networkRequest: NetworkRequest());
  HomeCubit() : super(HomeInitial());

  void getPlayers() async {
    try {
      emit(HomeInitial());
      if (await MethodUtils.isInternetPresent()) {
    ApiResponse<List<UserModel>> apiResponse = await homeRepo.getPlayers();
        if(apiResponse.isSuccess){
          emit(HomeLoaded(apiResponse.resObject!));
        }else{
          emit(HomeError(apiResponse.errorCause));
        }
      } else {
        emit(HomeError(AppMessages.getNoInternetMsg));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void matchRequest(String opponentId,BuildContext c) async {
    try {

      if (await MethodUtils.isInternetPresent()) {
    ApiResponse<String> apiResponse = await homeRepo.getMatchRequest(opponentId);
        if(apiResponse.isSuccess){
         //DailogShow
         //  showDialog(
         //      context: c,
         //      builder: (BuildContext context) =>
         //          MatchRequest() );
          //DailogShow
          MethodUtils.showAlertDialogCupertino(c,apiResponse.errorCause,
              apiResponse.resObject!,(){
            print("d");
          });
        }else{
          MethodUtils.showAlertDialogCupertino(c,apiResponse.errorCause,
              apiResponse.resObject!,(){
                print("d");
              });
        }
      } else {
        emit(HomeError(AppMessages.getNoInternetMsg));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
  
}
