part of 'profile_show_cubit.dart';

abstract class ProfileShowState extends Equatable {
  const ProfileShowState();
}

class ProfileShowInitial extends ProfileShowState {
  @override
  List<Object> get props => [];
}
class ProfileShowLoaded extends ProfileShowState {
  UserModel userModel;

  ProfileShowLoaded(this.userModel);

  @override
  List<Object> get props => [userModel];
}
class ProfileShowError extends ProfileShowState {
  String error;

  ProfileShowError(this.error);

  @override
  List<Object> get props => [error];
}
