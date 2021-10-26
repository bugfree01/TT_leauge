part of 'login_cubit.dart';

abstract class LoginState /*extends Equatable*/ {
  const LoginState();
}

class LoginInitial extends LoginState {

}

class LoginLoaded extends LoginState {
  late String msg;
  LoginLoaded(this.msg);
}

class LoginLoading extends LoginState {
}

class LoginStatisticLoaded extends LoginState {
  late StatisticModel statisticModel;
  LoginStatisticLoaded(this.statisticModel);
}

class LoginError extends LoginState {
  late String errorMSg;
  LoginError(this.errorMSg);
}