import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_1/cubit/app_cubit_states.dart';
import 'package:flutter_cubit_1/model/data_model.dart';
import 'package:flutter_cubit_1/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  void getData()async{
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }

}