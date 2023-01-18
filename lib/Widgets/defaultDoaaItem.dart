import 'package:flutter/material.dart';
import 'package:muslim/Model/DoaaModel/DoaaModel.dart';
import 'package:muslim/Screens/DoaaScreen/DoaaDetailsModel.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class defaultDoaaItem extends StatelessWidget {
  const defaultDoaaItem({Key? key, this.model}) : super(key: key);

  final DoaaModel? model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DoaaDetails(
                  id: model?.id,
                  name: model?.name,
                )));
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            gradient: LinearGradient(
              colors: [
                Colors.yellow.shade300,
                Colors.yellow.shade50
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Expanded(
            child: Center(
              child: Text(
                '${model?.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  fontFamily: 'UthmanicHafs',
                  color: AppConstant.defaultIconAndTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
