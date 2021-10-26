part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}
class HomeLoaded extends HomeState {
  late List<UserModel> players;
  HomeLoaded(this.players);

  @override
  List<Object> get props => [];
}
class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}
class HomeError extends HomeState {
  String error;

  HomeError(this.error);

  @override
  List<Object> get props => [];
}
