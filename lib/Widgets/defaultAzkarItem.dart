import 'package:flutter/material.dart';
import 'package:muslim/Model/AzkarModel/AzkaarModel.dart';
import 'package:muslim/Screens/AzkarScreen/AzkaarDetails.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class defaultAzkarItem extends StatelessWidget {
  const defaultAzkarItem({Key? key, this.model}) : super(key: key);

  final AzkarDataItem? model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AzkaarDetails(
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
          padding:  EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            gradient: LinearGradient(
              colors: [
                Colors.yellow.shade200,
                Colors.yellow.shade100
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Expanded(
              child: Text(
                '${model?.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  fontFamily:'UthmanicHafs' ,
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
