import 'package:flutter/material.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HijriDate extends StatelessWidget {
  const HijriDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.defaultAppBarColor,
          automaticallyImplyLeading: false,
          title: Text('العودة للرئيسية',
              style: TextStyle(
                  color: AppConstant.defaultIconAndTextColor,
                  fontWeight: FontWeight.bold,
                  fontFamily:'UthmanicHafs' ,
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
        body: SfHijriDateRangePicker(
          backgroundColor: Colors.grey[300],
          view: HijriDatePickerView.month,
          selectionColor: AppConstant.defaultIconAndTextColor,
          todayHighlightColor: AppConstant.defaultIconAndTextColor,
          selectionMode: DateRangePickerSelectionMode.single,
          showNavigationArrow: true,
        )
      ),
    );
  }
}
