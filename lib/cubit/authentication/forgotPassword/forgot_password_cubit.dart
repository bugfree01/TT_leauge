import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/helper/constant/appMessages.dart';
import 'package:tt_league/helper/routeAndBlocManager/navigator.dart';
import 'package:tt_league/network_configs/networkRequest.dart';
import 'package:tt_league/screen/authentication/LoginScreen.dart';

import 'forgotRepo.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordRepo forgotPasswordRepo = ForgotPasswordRepo(networkRequest:
  NetworkRequest());
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  void validation(UserModel userModel,BuildContext context){
    if(userModel.emailid!.isEmpty){
      emit(ForgotPasswordError("Enter Your Email-Id"));
    }else if(userModel.cPass.isEmpty){
      emit(ForgotPasswordError("Enter Your Password"));
    }else if(userModel.keycol!.isEmpty){
      emit(ForgotPasswordError("Enter Your Password"));
    }else if(userModel.keycol! != userModel.cPass){
      emit(ForgotPasswordError(AppMessages.forgotPassword));
    }else{
      emit(ForgotPasswordLoading());
      changePassword(userModel,context);
    }
  }

  void changePassword(UserModel userModel,BuildContext context)async{
    try{
      if(await MethodUtils.isInternetPresent()){
        ApiResponse<String> apiResponse = await forgotPasswordRepo
            .validateFromServer(password:userModel.cPass ,
            username:userModel.emailid! );
        if(apiResponse.isSuccess){
          emit(ForgotPasswordLoaded(apiResponse.resObject!));
          // openScreenAsPlatformWiseRoute(context, LoginScreen(),
          //     isExit: true);
        }
        else{
          emit(ForgotPasswordError(apiResponse.errorCause));
        }

      }else{
        emit(ForgotPasswordError(AppMessages.getNoInternetMsg));
      }


    }catch(e){
      emit(ForgotPasswordError(e.toString()));
    }
  }

}
