import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:muslim/Model/DoaaModel/DoaaDetailsModel.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class DoaaDetails extends StatefulWidget {
  final int? id;
  final String? name;

  const DoaaDetails({super.key, this.id, this.name});


  @override
  State<DoaaDetails> createState() => _DoaaDetailsState();
}

class _DoaaDetailsState extends State<DoaaDetails> {
  List<DoaaDetailsModel> sectionDetails = [];

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppConstant.defaultBackGround,
        appBar: AppBar(
          backgroundColor: AppConstant.defaultAppBarColor,
          automaticallyImplyLeading: false,
          title: Text(
            '${widget.name}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'UthmanicHafs',
                color: AppConstant.defaultIconAndTextColor),
          ),
          elevation: 5,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: AppConstant.defaultIconAndTextColor,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  margin: const EdgeInsets.all(5),
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.shade300,
                          Colors.yellow.shade50,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: Text(
                                  '${sectionDetails[index].zekr}',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: 'UthmanicHafs',
                                      fontWeight: FontWeight.bold,
                                      color: AppConstant.defaultIconAndTextColor),
                                  maxLines: 10,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: AppConstant.defaultAppBarColor,
                          ),
                          Center(
                            child: Text(
                              '${sectionDetails[index].category}',
                              style:  TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppConstant.defaultIconAndTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>  SizedBox(height: 2.h,),
              itemCount: sectionDetails.length),
        ),
      ),
    );
  }

  LoadData() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString('assets/doaaDetails.json')
        .then((value) {
      var response = json.decode(value);
      response.forEach((data) {
        print(response);
        DoaaDetailsModel _section = DoaaDetailsModel.fromJson(data);
        if (_section.id_doaa == widget.id) {
          sectionDetails.add(_section);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
  }
}
