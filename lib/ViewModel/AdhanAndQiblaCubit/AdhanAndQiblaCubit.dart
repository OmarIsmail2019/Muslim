import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Model/AdhanModel/AdhanModel.dart';
import 'package:muslim/Model/QiblaModel/QiblaModel.dart';
import 'package:muslim/ViewModel/AdhanAndQiblaCubit/AdhanAndQiblaState.dart';
import 'package:muslim/ViewModel/NetWork/Remotly/qiblaDioHelper.dart';

class AdhanAndQiblaCubit extends Cubit<QiblaStates> {
  AdhanAndQiblaCubit() : super(QiblaInitialState());

  static AdhanAndQiblaCubit get(context) => BlocProvider.of(context);

  QiblaModel? model;

  Future getQibla() async {
    emit(QiblaLoadingState());
    await qiblaNetWork
        .getQiblaData(url: 'qibla/25.4106386/51.1846025')
        .then((value) {
      model = QiblaModel.fromJson(value.data);
      print("+++++++++++++++++++++++");
      print(value.data);
      print("+++++++++++++++++++++++");
      emit(QiblaSuccessState());
    }).catchError((error) {
      print("_______________________");
      print(error);
      print("_______________________");
      emit(QiblaErrorState());
    });
  }

  AdhanModel? adhanModel;

  Future getAdhan() async {
    emit(AdhanLoadingState());
    qiblaNetWork.getQiblaData(url: 'timingsByCity?', query: {
      'city': 'cairo',
      'country': 'Egypt',
      'method': 8,
    }).then((value) {
      adhanModel = AdhanModel.fromJson(value.data);
      print("+++++++++++++++++++++++");
      print(value.data);
      print("+++++++++++++++++++++++");

      emit(AdhanSuccessState());
    }).catchError((error) {
      print("_______________________");
      print(error.toString());
      print("_______________________");
      emit(AdhanErrorState());
    });
  }
}
