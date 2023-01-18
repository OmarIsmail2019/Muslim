import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Screens/AzkarScreen/AzkarHomePage.dart';
import 'package:muslim/Screens/DoaaScreen/DoaaHomePage.dart';
import 'package:muslim/Screens/HijriDateScreen/HijriData.dart';
import 'package:muslim/Screens/LayOut/HomeLayOut.dart';
import 'package:muslim/Screens/QuranScreens/SurahScreen.dart';
import 'package:muslim/Screens/SplashScreen/SplashScreen.dart';
import 'package:muslim/ViewModel/AdhanAndQiblaCubit/AdhanAndQiblaCubit.dart';
import 'package:muslim/ViewModel/NetWork/Remotly/quranDioHelper.dart';
import 'package:muslim/ViewModel/QuranCubit/quranCubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await quranNetWork.init();
  await quranNetWork.initAdhan();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>QuranCubit()..getRandomAyah()..getAdhan()..getQuran()),
      ],
      child: MaterialApp(
        title: 'Muslim',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/layout': (context) => const HomeLayOut(),
          '/surah': (context) => const SurahScreen(),
          '/hijri': (context) => const HijriDate(),
          '/azkar': (context) => const AzkarHomePage(),
          '/doaa': (context) => const DoaaHomePage(),
        },
      ),
    );
  }
}
