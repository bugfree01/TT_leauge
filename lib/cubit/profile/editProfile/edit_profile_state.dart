part of 'edit_profile_cubit.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();
}

class EditProfileInitial extends EditProfileState {
  @override
  List<Object> get props => [];
}
class EditProfileLoaded extends EditProfileState {
  late UserModel userModel;
  String? msg;

  EditProfileLoaded({required this.userModel,this.msg});

  @override
  List<Object> get props => [];
}
class EditProfileLoading extends EditProfileState {
  @override
  List<Object> get props => [];
}
class EditProfileError extends EditProfileState {
  String error;

  EditProfileError(this.error);

  @override
  List<Object> get props => [];
}
