part of 'leaderboard_cubit.dart';

abstract class LeaderboardState extends Equatable {
  const LeaderboardState();
}

class LeaderboardInitial extends LeaderboardState {
  @override
  List<Object> get props => [];
}
class LeaderboardLoaded extends LeaderboardState {
  late List<LeadrboardModel> players;

  LeaderboardLoaded(this.players);

  @override
  List<Object> get props => [];
}
class LeaderboardError extends LeaderboardState {
  String error;

  LeaderboardError(this.error);

  @override
  List<Object> get props => [];
}
