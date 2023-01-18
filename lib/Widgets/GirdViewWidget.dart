import 'package:flutter/material.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class DefaultGridView extends StatelessWidget {
  const DefaultGridView(
      {Key? key,
      required this.text,
      required this.image,
      required this.onTap,
     })
      : super(key: key);

  final String text;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.sp),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0.sp),
            gradient: LinearGradient(
              colors: [
                Colors.yellow.shade300,
                Colors.yellow.shade50
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(image,fit: BoxFit.contain,width: 13.w,),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'UthmanicHafs',
                  color: AppConstant.defaultIconAndTextColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
