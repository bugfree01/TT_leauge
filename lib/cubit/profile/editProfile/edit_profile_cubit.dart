import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/helper/constant/appMessages.dart';
import 'package:tt_league/helper/localStorage/preference_handler.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

import 'editProfileRepo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileRepo editProfileRepo = EditProfileRepo(networkRequest: NetworkRequest());
  EditProfileCubit() : super(EditProfileInitial());
  late UserModel userModel;

  void getUSerData()async{
    emit(EditProfileInitial());
    userModel = UserModel(
      fullname:(await PreferenceHandler.getName())!,
      age: (await PreferenceHandler.getAge()),
      location: (await PreferenceHandler.getLocation())!,
      mobile: (await PreferenceHandler.getMobile())!,
      keycol: (await PreferenceHandler.getPassword())!,
      tshirt: (await PreferenceHandler.getShirt())!,
      preftime: (await PreferenceHandler.getPreffTime())!,
      preflocation: (await PreferenceHandler.getPrefLocation())!,
      description: (await PreferenceHandler.getAboutMe())!,
      shirtRedeemed: (await PreferenceHandler.getShirtRedeem())!,
      image1: (await PreferenceHandler.getPalyerImage())!,
      image2: (await PreferenceHandler.getPalyerImage1())!,
      image3: (await PreferenceHandler.getPalyerImage2())!,
      image4: (await PreferenceHandler.getPalyerImage3())!,
      image5: (await PreferenceHandler.getPalyerImage4())!,
      image6: (await PreferenceHandler.getPalyerImage5())!,
    );

    emit(EditProfileLoaded(userModel: userModel));
  }

  void updateUserData(UserModel userModel)async{
    try {
      emit(EditProfileLoading());
      if (await MethodUtils.isInternetPresent()) {
        ApiResponse<String> apiResponse = await editProfileRepo
            .updateUserData(userModel: userModel);
        if (apiResponse.isSuccess) {
          await PreferenceHandler.setName(userModel.fullname??"");
          await PreferenceHandler.setAboutMe(
              userModel.description??"");
          userModel.image1 = (await PreferenceHandler.getPalyerImage())!;
          await PreferenceHandler.setAge(userModel.age??"");
          // await PreferenceHandler.setWins(
          //     userModel.wins!.toString());
          await PreferenceHandler.setLocation(
              userModel.location??"");
          await PreferenceHandler.setPrefLocation(
              userModel.preflocation??"");
          await PreferenceHandler.setPreffTime(
              userModel.preftime??"");
          // await PreferenceHandler.setGoldWins(
          //     userModel.goldwins!);
          await PreferenceHandler.setShirt(userModel.tshirt??"");
          // await PreferenceHandler.setSilverWins(
          //     userModel.silverwins!);
          // await PreferenceHandler.setBronzeWins(
          //     userModel.bronzewins!);
          await PreferenceHandler.setPalyerLevel(
              userModel.playerlevel??"");
          await PreferenceHandler.setShirtRedeem(
              userModel.shirtRedeemed??"");
          // await PreferenceHandler.setPassword(userModel.keycol!);
          await PreferenceHandler.setMobile(userModel.mobile);

          emit(EditProfileLoaded(userModel: userModel,msg:apiResponse.resObject));
        } else {
          emit(EditProfileError(apiResponse.errorCause));
        }
      } else {
        emit(EditProfileError(AppMessages.getNoInternetMsg));
      }
    } catch (e) {
      emit(EditProfileError(e.toString()));
    }
  }

}
