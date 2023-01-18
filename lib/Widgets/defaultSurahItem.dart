import 'package:flutter/material.dart';
import 'package:muslim/Model/QuranModel/AllQuranModel.dart';
import 'package:muslim/Screens/QuranScreens/AyahsOfSurahs.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class defaultSurahItem extends StatelessWidget {
  final SurahsOfQuranModel model;
  final int index;

  const defaultSurahItem({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AyahsOfSurah(
                      id: index + 1,
                    )));
      },
      child: Card(
        elevation: 10,
        shadowColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 2.w, right: 2.w),
          height: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.yellow.shade200,
                Colors.yellow.shade100
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/back.png',
                width: 10.w,
                height: 7.h,
              ),
              SizedBox(width: 2.w,),
              Expanded(
                child: Text(
                  '${model.name}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      fontFamily: 'UthmanicHafs',
                      color: AppConstant.defaultIconAndTextColor),
                ),
              ),
              const Spacer(),
              if (model.revelationType == 'Meccan')
                Image.asset(
                  'assets/images/kaba.png',
                  width: 8.w,
                  height: 6.h,
                ),
              if (model.revelationType == 'Medinan')
                Image.asset(
                  'assets/images/mosque.png',
                  width: 8.w,
                  height: 6.h,
                ),

              SizedBox(
                width: 3.w,
              ),
              CircleAvatar(
                radius: 15.sp,
                backgroundColor: Colors.yellow.shade300,
                child: Text('${model.number}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppConstant.defaultIconAndTextColor,
                    )),
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
