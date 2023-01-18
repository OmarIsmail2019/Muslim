import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Model/AdhanModel/AdhanModel.dart';
import 'package:muslim/Model/QuranModel/AllQuranModel.dart';
import 'package:muslim/Model/QuranModel/AyahOfDayModel.dart';
import 'package:muslim/Model/QuranModel/SurahModel.dart';
import 'package:muslim/ViewModel/NetWork/Remotly/quranDioHelper.dart';
import 'package:muslim/ViewModel/QuranCubit/quranState.dart';

class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranInitialState());

  static QuranCubit get(context) => BlocProvider.of(context);

  int idSurah = 0;

  AyatModel? ayah;

  Future getSurah({required int id}) async {
    emit(SurahLoadingState());
    return quranNetWork.getDataQuran(url: 'surah/$id/ar.alafasy').then((value) {
      ayah = AyatModel.fromJson(value.data);
      print("+++++++++++++++++++++");
      print(value.data);
      print("+++++++++++++++++++++");
      emit(SurahSuccessState());
    }).catchError((error) {
      print("--------------------------");
      print(error.toString());
      print("--------------------------");
      emit(SurahErrorState());
    });
  }

  AllQuran? quran;

  Future getQuran() async {
    emit(QuranLoadingState());
    return await quranNetWork.getDataQuran(url: 'quran/quran-uthmani').then((value) {
      quran = AllQuran.fromJson(value.data);
      print("+++++++++++++++++++++++++");
      print(value.data);
      print("+++++++++++++++++++++++++");
      emit(QuranSuccessState());
    }).catchError((error) {
      print("-------------------------");
      print(error.toString());
      print("------------------------");
      emit(QuranErrorState());
    });
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  AyahOfDayModel? ayahOfDayModel;

  void getRandomAyah() {
    emit(LoadingRandomAyahOfDay());
    quranNetWork
        .getDataQuran(
            url:
                'ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall')
        .then((value) {
      ayahOfDayModel = AyahOfDayModel.fromJson(value.data);
      print(value.data);
      emit(SuccessRandomAyahOfDay());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRandomAyahOfDay());
    });
  }

  AdhanModel? adhanModel;

  Future getAdhan() async {
    emit(AdhanLoadingState());
    quranNetWork.getQiblaData(url: 'timingsByCity?', query: {
      'city': 'cairo',
      'country': 'Egypt',
      'method': "8",
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

  double fontSize = 28;

  void PlusFontSize() {
    if (fontSize <= 40) {
      fontSize++;
    }
    emit(SuccessPlusFontSizeState());
  }

  void MinusFontSize() {
    if (fontSize >= 20) {
      fontSize--;
    }
    emit(SuccessMinusFontSizeState());
  }
}
