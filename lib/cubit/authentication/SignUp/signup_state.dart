part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoaded extends SignupState{
  late String msg;
  SignupLoaded(this.msg);
}

class SignupLoading extends SignupState{}

class SignupError extends SignupState{
  late String errorMsg;
  SignupError(this.errorMsg);
}


