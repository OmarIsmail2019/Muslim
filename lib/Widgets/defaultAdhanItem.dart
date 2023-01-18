import 'package:flutter/material.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class defaultAdhanItem extends StatelessWidget {
  const defaultAdhanItem(
      {Key? key,
      required this.arbText,
      required this.time})
      : super(key: key);

  final String arbText;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            shadowColor: Colors.grey[900],
            elevation: 20,
            color: AppConstant.defaultBackGround,
            child: Container(
              height: 8.h,
              width: 17.w,
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
              child: Center(
                child: Text(
                  arbText,
                  style: TextStyle(
                      fontFamily: 'UthmanicHafs',
                      fontWeight: FontWeight.bold,
                      color: AppConstant.defaultIconAndTextColor,
                      fontSize: 24),
                ),
              ),
            )),
        Card(
            margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h,bottom: 2.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            shadowColor: Colors.grey[900],
            elevation: 20,
            color: AppConstant.defaultBackGround,
            child: Container(
              height: 8.h,
              width: 17.w,
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
              child: Center(
                child: Text(
                  time,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppConstant.defaultIconAndTextColor,
                      fontSize: 18.sp),
                ),
              ),
            )),
        // Card(
        //     margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(15.sp),
        //     ),
        //     shadowColor: Colors.grey[900],
        //     elevation: 20,
        //     color: AppConstant.defaultBackGround,
        //     child: Container(
        //       height: 8.h,
        //       width: 26.w,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(15.sp),
        //         gradient: LinearGradient(
        //           colors: [
        //             Colors.yellow.shade300,
        //             Colors.yellow.shade50
        //           ],
        //           begin: Alignment.topRight,
        //           end: Alignment.bottomLeft,
        //         ),
        //       ),
        //       child: Center(
        //         child: Text(
        //           engText,
        //           style: TextStyle(
        //               fontFamily: 'UthmanicHafs',
        //               fontWeight: FontWeight.bold,
        //               color: AppConstant.defaultIconAndTextColor,
        //               fontSize: 24),
        //         ),
        //       ),
        //     )),
      ],
    );
  }
}
