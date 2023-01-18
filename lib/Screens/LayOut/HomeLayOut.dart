import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/Screens/QiblaScreen/Qibla.dart';
import 'package:muslim/ViewModel/QuranCubit/quranCubit.dart';
import 'package:muslim/ViewModel/QuranCubit/quranState.dart';
import 'package:muslim/Widgets/GirdViewWidget.dart';
import 'package:muslim/Widgets/defaultAdhanItem.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<QuranCubit, QuranStates>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: AppConstant.defaultBackGround,
            appBar: AppBar(
              backgroundColor: AppConstant.defaultAppBarColor,
              elevation: 10,
              centerTitle: true,
              title: Text(
                'الصراط المستقيم',
                style: TextStyle(
                    fontFamily: 'UthmanicHafs',
                    fontWeight: FontWeight.bold,
                    color: AppConstant.defaultIconAndTextColor,
                    fontSize: 30),
              ),
            ),
            body: Sizer(
              builder: (context, orientation, deviceType) {
                return Padding(
                  padding: EdgeInsets.all(2.sp),
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Card(
                            margin: EdgeInsets.only(
                                left: 4.w, right: 4.w, top: 2.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            shadowColor: Colors.grey[900],
                            elevation: 20,
                            color: AppConstant.defaultBackGround,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.yellow.shade300,
                                    Colors.yellow.shade50
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ' التاريخ الهجري:${QuranCubit.get(context).adhanModel?.data?.date?.hijri?.day}-${QuranCubit.get(context).adhanModel?.data?.date?.hijri?.month?.ar}-${QuranCubit.get(context).adhanModel?.data?.date?.hijri?.year}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: AppConstant
                                            .defaultIconAndTextColor),
                                  ),
                                  Text(
                                    ' التاريخ الميلأدي:${QuranCubit.get(context).adhanModel?.data?.date?.gregorian?.day}${QuranCubit.get(context).adhanModel?.data?.date?.gregorian?.month?.en}${QuranCubit.get(context).adhanModel?.data?.date?.gregorian?.year}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: AppConstant
                                            .defaultIconAndTextColor),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'مواعيد ألأذان',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'UthmanicHafs',
                            color: AppConstant.defaultIconAndTextColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.only(
                              left: 4.w, right: 4.w, top: 2.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          shadowColor: Colors.grey[900],
                          elevation: 20,
                          color: AppConstant.defaultBackGround,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  gradient: LinearGradient(colors: [
                                    Colors.yellow.shade300,
                                    Colors.yellow.shade50
                                  ])),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    defaultAdhanItem(
                                        arbText: 'الفجر',
                                        time:
                                        '${QuranCubit.get(context).adhanModel?.data?.timings?.fajr}'),
                                    defaultAdhanItem(
                                        arbText: 'الشروق',
                                        time:
                                        '${QuranCubit.get(context).adhanModel?.data?.timings?.sunrise}'),
                                    defaultAdhanItem(
                                        arbText: 'الظهر',
                                        time:
                                        '${QuranCubit.get(context).adhanModel?.data?.timings?.dhuhr}'),
                                    defaultAdhanItem(
                                        arbText: 'العصر',
                                        time:
                                        '${QuranCubit.get(context).adhanModel?.data?.timings?.asr}'),
                                    defaultAdhanItem(
                                        arbText: 'المغرب',
                                        time:
                                        '${QuranCubit.get(context).adhanModel?.data?.timings?.maghrib}'),
                                    defaultAdhanItem(
                                        arbText: 'العشاء',
                                        time:
                                        '${QuranCubit.get(context).adhanModel?.data?.timings?.isha}'),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Card(
                          margin: EdgeInsets.only(
                              left: 3.w, right: 3.w, top: 2.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          shadowColor: Colors.grey[900],
                          elevation: 11,
                          color: AppConstant.defaultBackGround,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.yellow.shade300,
                                  Colors.yellow.shade50
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                        "${QuranCubit.get(context).ayahOfDayModel?.arText} ",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'UthmanicHafs',
                                            color: AppConstant
                                                .defaultIconAndTextColor)),
                                    TextSpan(
                                        text:
                                        '《${QuranCubit.get(context).ayahOfDayModel?.surNumber.toString()}》',
                                        style:  TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber)),
                                  ])),
                            ),
                          ),
                        ),
                        // ConditionalBuilder(
                        //   condition: state is SuccessRandomAyahOfDay,
                        //   builder: (context) {
                        //     return Card(
                        //       margin: EdgeInsets.only(
                        //           left: 3.w, right: 3.w, top: 2.h),
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(15.sp),
                        //       ),
                        //       shadowColor: Colors.grey[900],
                        //       elevation: 11,
                        //       color: AppConstant.defaultBackGround,
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(15.sp),
                        //           gradient: LinearGradient(
                        //             colors: [
                        //               Colors.yellow.shade300,
                        //               Colors.yellow.shade50
                        //             ],
                        //             begin: Alignment.topRight,
                        //             end: Alignment.bottomLeft,
                        //           ),
                        //         ),
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(3.0),
                        //           child: RichText(
                        //               text: TextSpan(children: [
                        //                 TextSpan(
                        //                     text:
                        //                     "${QuranCubit.get(context).ayahOfDayModel?.arText} ",
                        //                     style: TextStyle(
                        //                         fontSize: 20.sp,
                        //                         fontWeight: FontWeight.bold,
                        //                         fontFamily: 'UthmanicHafs',
                        //                         color: AppConstant
                        //                             .defaultIconAndTextColor)),
                        //                 TextSpan(
                        //                     text:
                        //                     '《${QuranCubit.get(context).ayahOfDayModel?.surNumber.toString()}》',
                        //                     style: TextStyle(
                        //                         fontSize: 24,
                        //                         fontWeight: FontWeight.bold,
                        //                         color: Colors.pink[500])),
                        //               ])),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   fallback: (context) => Center(
                        //       child: CircularProgressIndicator(
                        //         color: AppConstant.defaultIconAndTextColor,
                        //       )),
                        // ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GridView.count(
                          childAspectRatio: 1 / 0.50.sp,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 18,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: <Widget>[
                            DefaultGridView(
                                onTap: () {
                                  Navigator.pushNamed(context, '/surah');
                                },
                                text: 'القران الكريم',
                                image: 'assets/images/back.png'),
                            DefaultGridView(
                                onTap: () {
                                  Navigator.pushNamed(context, '/azkar');
                                },
                                text: 'ألاذكار',
                                image: 'assets/images/azkar.png'),
                            DefaultGridView(
                                onTap: () {
                                  Navigator.pushNamed(context, '/doaa');
                                },
                                text: 'ألادعية',
                                image: 'assets/images/doaa.png'),
                            DefaultGridView(
                                onTap: () {
                                  Navigator.pushNamed(context, '/hijri');
                                },
                                text: 'التقويم الهجري',
                                image: 'assets/images/calendar.png'),
                            DefaultGridView(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QiblaScreen()));
                                },
                                text: 'القبلة',
                                image: 'assets/images/qibla (2).png'),
                          ],
                        ),
                      ]),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
