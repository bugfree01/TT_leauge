part of 'match_request_cubit.dart';

abstract class MatchRequestState extends Equatable {
  const MatchRequestState();
}

class MatchRequestInitial extends MatchRequestState {
  @override
  List<Object> get props => [];
}
class MatchRequestLoaded extends MatchRequestState {
  List<Requests> opponentData;

  MatchRequestLoaded(this.opponentData);

  @override
  List<Object> get props => [opponentData];
}
class MatchRequestError extends MatchRequestState {
  String error;

  MatchRequestError(this.error);

  @override
  List<Object> get props => [error];
}
