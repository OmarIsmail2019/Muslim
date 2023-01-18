import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:muslim/ViewModel/QuranCubit/quranCubit.dart';
import 'package:muslim/ViewModel/QuranCubit/quranState.dart';
import 'package:muslim/Widgets/defaultSurahItem.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit()..getQuran(),
      child: BlocBuilder<QuranCubit, QuranStates>(builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: AppConstant.defaultBackGround,
            appBar: AppBar(
              backgroundColor: AppConstant.defaultAppBarColor,
              automaticallyImplyLeading: false,
              elevation: 9,
              title: Text('العودة للرئيسية',
                  style:TextStyle(
                      color: AppConstant.defaultIconAndTextColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'UthmanicHafs',
                      fontSize: 25)),
              leading:  IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: AppConstant.defaultIconAndTextColor,
                  )),
            ),
            body: ConditionalBuilder(
              condition: state is QuranSuccessState,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => defaultSurahItem(
                            model: QuranCubit.get(context)
                                .quran!
                                .data!
                                .surahs![index],
                            index: index,
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 1.5.h,
                          ),
                      itemCount:
                          QuranCubit.get(context).quran!.data!.surahs!.length),
                );
              },
              fallback: (BuildContext context) =>  Center(
                  child:  LoadingAnimationWidget.inkDrop(
                    color: Colors.black,
                    size: 100,
                  ),),
            ),
          ),
        );
      }),
    );
  }
}
