import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tt_league/Model/responseCallBacks.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/cubit/search/searchRepo.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/helper/constant/appMessages.dart';
import 'package:tt_league/network_configs/networkRequest.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepo searchRepo = SearchRepo(NetworkRequest());
  SearchCubit() : super(SearchInitial());

  void getSearchDetail(String keyword,String filter)async{
    emit(SearchInitial());
    if (await MethodUtils.isInternetPresent()) {
      if(keyword==null && keyword.isEmpty){
        emit(SearchError("No Result Found!"));
      }
      ApiResponse<List<UserModel>> searchModel = await searchRepo.getPlayers
        (keyword,filter);
      if(searchModel.isSuccess){
       emit(SearchLoaded(searchModel.resObject!));
      }
      else{
        emit(SearchError(searchModel.errorCause));
      }
    }else{
      emit(SearchError(AppMessages.getNoInternetMsg));
    }

  }

  void refresh(){
    emit(SearchInitial());
  }
}
