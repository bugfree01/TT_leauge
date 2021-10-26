import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tt_league/Model/leaderboard.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/cubit/authentication/SignUp/SignupRepo.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/helper/constant/appMessages.dart';
import 'package:tt_league/helper/localStorage/preference_handler.dart';
import 'package:tt_league/helper/routeAndBlocManager/navigator.dart';
import 'package:tt_league/network_configs/networkRequest.dart';
import 'package:tt_league/screen/bottomNavigation.dart';
import 'package:tt_league/screen/customWidget/singupLoadingPicScreen.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupRepo signupRepo = SignupRepo(networkRequest: NetworkRequest());
  SignupCubit() : super(SignupInitial());

  void validation(UserModel userModel,BuildContext context)async{
    if(userModel.fullname!.isEmpty){
      emit(SignupError("Enter Your Name"));
    }else if(userModel.cPass.isEmpty){
      emit(SignupError("Enter Your Password"));
    }if(userModel.keycol!.isEmpty){
      emit(SignupError("Enter Your Password"));
    }else if(userModel.mobile.isEmpty){
      emit(SignupError("Enter Your Mobile Number"));
    }if(userModel.emailid!.isEmpty){
      emit(SignupError("Enter Your Email-Id"));
    }else if(userModel.playerlevel!.isEmpty){
      emit(SignupError("Select Your Level"));
    }else if(userModel.keycol! != userModel.cPass){
      emit(SignupError(AppMessages.forgotPassword));
    }else{
      registerClient( userModel, context);
    }
  }

  void registerClient(UserModel userModel,BuildContext context)async{
    try{
      if(await MethodUtils.isInternetPresent()){
          ApiResponse<LeadrboardModel> apiResponse = await signupRepo.register(userModel);
          if(apiResponse.isSuccess){
            await PreferenceHandler.setLogIn(true);
            await PreferenceHandler.setUserId(apiResponse.resObject!.userid!
                .toString());

            await PreferenceHandler.setUserId(apiResponse.resObject!.userid!);
            await PreferenceHandler.setName(apiResponse.resObject!.fullname!);
            await PreferenceHandler.setAboutMe(apiResponse.resObject!
                .description!);
            await PreferenceHandler.setAge(apiResponse.resObject!.age!);
            await PreferenceHandler.setWinPercentage(apiResponse.resObject!
                .percentage!);
            await PreferenceHandler.setWins(apiResponse.resObject!.wins!.toString());
            await PreferenceHandler.setMatches(apiResponse.resObject!.matches!
                .toString());
            await PreferenceHandler.setLocation(apiResponse.resObject!
                .location!);
            await PreferenceHandler.setPalyerLevel(apiResponse.resObject!
                .playerlevel!);
            await PreferenceHandler.setPassword(apiResponse.resObject!
                .keycol!);
            await PreferenceHandler.setEmail(apiResponse.resObject!.emailid!);
            await PreferenceHandler.setMobile(apiResponse.resObject!.notifyto!);

            await PreferenceHandler.setPalyerImage(apiResponse.resObject!.playerimage!);

            openScreenAsPlatformWiseRoute(context, SinupLoadingPics(),
                isExit: true);
          }
          else{
            emit(SignupError(apiResponse.errorCause));
          }

      }else{
        emit(SignupError(AppMessages.getNoInternetMsg));
      }


    }catch(e){
      emit(SignupError(e.toString()));
    }
  }

}
