import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:muslim/ViewModel/QuranCubit/quranCubit.dart';
import 'package:muslim/ViewModel/QuranCubit/quranState.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class AyahsOfSurah extends StatefulWidget {
  const AyahsOfSurah({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<AyahsOfSurah> createState() => _AyahsOfSurahState();
}

class _AyahsOfSurahState extends State<AyahsOfSurah> {
  double brightness = 0.0;

  bool togel = false;

  @override
  void initState() {
    super.initState();
    PlatformBrighteens();
  }

  Future<void> PlatformBrighteens() async {
    double bright;
    try {
      bright = await FlutterScreenWake.brightness;
    } on PlatformException {
      bright = 1.0;
    }
    if (!mounted) return;
    setState(() {
      brightness = bright;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppConstant.defaultBackGround,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'العودة',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'UthmanicHafs',
                color: AppConstant.defaultIconAndTextColor),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: AppConstant.defaultIconAndTextColor,
              )),
          automaticallyImplyLeading: false,
          backgroundColor: AppConstant.defaultAppBarColor,
        ),
        body: BlocProvider(
            create: (context) => QuranCubit()..getSurah(id: widget.id),
            child: BlocBuilder<QuranCubit, QuranStates>(
              builder: (context, state) {
                QuranCubit cubit = BlocProvider.of(context);
                return ConditionalBuilder(
                  condition: state is SurahSuccessState,
                  builder: (context) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  '${cubit.ayah?.data?.name}',
                                  style:  TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                    color: AppConstant.defaultIconAndTextColor,
                                    fontFamily: 'UthmanicHafs',
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              Text(
                                '${cubit.ayah?.data?.ayahs?.length}  أية',
                                style:  TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppConstant.defaultIconAndTextColor,
                                    fontSize: 24,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                          RichText(
                              text: TextSpan(children: [
                            for (int i = 0;
                                i < cubit.ayah!.data!.ayahs!.length;
                                i++) ...{
                              TextSpan(
                                  text: "${cubit.ayah?.data?.ayahs?[i].text} ",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'UthmanicHafs',
                                      color:
                                          AppConstant.defaultIconAndTextColor)),
                              TextSpan(
                                  text:
                                      '《${cubit.ayah?.data?.ayahs?[i].numberInSurah.toString()}》',
                                  style:  const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber)),
                            }
                          ])),
                        ],
                      ),
                    );
                  },
                  fallback: (context) => Center(
                    child:  LoadingAnimationWidget.inkDrop(
                      color: Colors.black,
                      size: 100,
                    ),),
                );
              },
            )),
      ),
    );
  }
}
