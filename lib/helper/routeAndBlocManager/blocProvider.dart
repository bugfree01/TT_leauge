import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:tt_league/cubit/authentication/SignUp/signup_cubit.dart';
import 'package:tt_league/cubit/authentication/forgotPassword/forgot_password_cubit.dart';
import 'package:tt_league/cubit/authentication/login/login_cubit.dart';
import 'package:tt_league/cubit/home/home_cubit.dart';
import 'package:tt_league/cubit/leaderboard/leaderboard_cubit.dart';
import 'package:tt_league/cubit/matchRequest/match_request_cubit.dart';
import 'package:tt_league/cubit/profile/editProfile/edit_profile_cubit.dart';
import 'package:tt_league/cubit/profile/profileShow/profile_show_cubit.dart';
import 'package:tt_league/cubit/search/search_cubit.dart';

class BlocManager {
  static List<BlocProviderSingleChildWidget> get blocProviders => [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => LeaderboardCubit()),
        BlocProvider(create: (context) => EditProfileCubit()),
        BlocProvider(create: (context) => ForgotPasswordCubit()),
        BlocProvider(create: (context) => ProfileShowCubit()),
        BlocProvider(create: (context) => MatchRequestCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => SearchCubit()),
      ];
}
