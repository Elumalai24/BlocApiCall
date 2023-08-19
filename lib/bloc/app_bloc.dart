import 'package:bloc_api/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/api_service.dart';
import 'app_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{
 final ApiService _apiService;
  ProductBloc(this._apiService) : super(LoadingState()){
    on<LoadProductEvent>((event, emit)async{
      emit(LoadingState());
      try{
final products = await _apiService.getProducts();
emit(LoadedState(products));
      }
      catch(e){
        emit(ErrorState(e.toString()));
      }
    });
  }
}