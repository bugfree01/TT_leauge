part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordLoaded extends ForgotPasswordState {
String msg;

ForgotPasswordLoaded(this.msg);

  @override
  List<Object> get props => [];
}

class ForgotPasswordError extends ForgotPasswordState {
  String error;

  ForgotPasswordError(this.error);

  @override
  List<Object> get props => [];
}

class ForgotPasswordLoading extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}
