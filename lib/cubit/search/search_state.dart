part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}
class SearchLoaded extends SearchState {
  List<UserModel> searchModel;

  SearchLoaded(this.searchModel);

  @override
  List<Object> get props => [searchModel];
}
class SearchError extends SearchState {
  String error;

  SearchError(this.error);

  @override
  List<Object> get props => [error];
}
