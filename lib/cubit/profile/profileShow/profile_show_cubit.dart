import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/cubit/authentication/login/LoginRepo.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/helper/constant/appMessages.dart';
import 'package:tt_league/helper/localStorage/preference_handler.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

part 'profile_show_state.dart';

class ProfileShowCubit extends Cubit<ProfileShowState> {
  LoginRepo loginRepo = LoginRepo(networkRequest: NetworkRequest());
  late ApiResponse<UserModel> userDetail;
  ProfileShowCubit() : super(ProfileShowInitial());

  void validateFromServer() async {
    try {
      emit(ProfileShowInitial());
      if (await MethodUtils.isInternetPresent()) {

        String userName  = (await PreferenceHandler.getEmail())!;
        String password = (await PreferenceHandler.getPassword())!;

          userDetail = await loginRepo.validateFromServer(
              password: password, username: userName);
          if (userDetail.isSuccess) {

            emit(ProfileShowLoaded(userDetail.resObject!));
          } else {
            emit(ProfileShowError(userDetail.errorCause));
          }

      } else {
        emit(ProfileShowError(AppMessages.getNoInternetMsg));
      }
    } catch (e) {
      emit(ProfileShowError(e.toString()));
    }
  }


}
