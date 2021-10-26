import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_league/Model/matchRequestModel.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/helper/constant/appMessages.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

import 'matchRequest.dart';

part 'match_request_state.dart';

class MatchRequestCubit extends Cubit<MatchRequestState> {
  MatchRequestRepo matchRequestRepo = MatchRequestRepo(networkRequest:
  NetworkRequest());
  MatchRequestCubit() : super(MatchRequestInitial());

  void getMatchReqData()async{
    try{
      emit(MatchRequestInitial());
      if(await MethodUtils.isInternetPresent()){
        ApiResponse<MatchRequestModel> apiResponse = await matchRequestRepo.getMatchData();
        if(apiResponse.isSuccess){
          emit(MatchRequestLoaded(apiResponse.resObject!.requests!));
        }
        else{
          emit(MatchRequestError(apiResponse.errorCause));
        }

      }else{
        emit(MatchRequestError(AppMessages.getNoInternetMsg));
      }


    }catch(e){
      emit(MatchRequestError(e.toString()));
    }
  }

   getPendingReqData()async{
    try{
      emit(MatchRequestInitial());
      if(await MethodUtils.isInternetPresent()){
        ApiResponse<MatchRequestModel> apiResponse = await matchRequestRepo.getPendingMatches();
        if(apiResponse.isSuccess){
          emit(MatchRequestLoaded(apiResponse.resObject!.requests!));
        }
        else{
          emit(MatchRequestError(apiResponse.errorCause));
        }

      }else{
        emit(MatchRequestError(AppMessages.getNoInternetMsg));
      }


    }catch(e){
      emit(MatchRequestError(e.toString()));
    }
  }

   getCompleteReqData()async{
    try{
      emit(MatchRequestInitial());
      if(await MethodUtils.isInternetPresent()){
        ApiResponse<MatchRequestModel> apiResponse = await matchRequestRepo
            .getCompletedMatches();
        if(apiResponse.isSuccess){
          emit(MatchRequestLoaded(apiResponse.resObject!.requests!));
        }
        else{
          emit(MatchRequestError(apiResponse.errorCause));
        }

      }else{
        emit(MatchRequestError(AppMessages.getNoInternetMsg));
      }


    }catch(e){
      emit(MatchRequestError(e.toString()));
    }
  }


}
