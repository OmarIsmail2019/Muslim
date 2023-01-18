import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:muslim/Model/DoaaModel/DoaaModel.dart';
import 'package:muslim/Widgets/defaultDoaaItem.dart';
import 'package:muslim/constant/AppColor.dart';

class DoaaHomePage extends StatefulWidget {
  const DoaaHomePage({Key? key}) : super(key: key);

  @override
  _DoaaHomePageState createState() => _DoaaHomePageState();
}

class _DoaaHomePageState extends State<DoaaHomePage> {
  List<DoaaModel> section = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor:AppConstant.defaultBackGround,
          appBar: AppBar(
            title: Text(
              'الادعية',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:25,
                  fontFamily: 'UthmanicHafs',
                  color: AppConstant.defaultIconAndTextColor),
            ),
            backgroundColor:AppConstant.defaultAppBarColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: AppConstant.defaultIconAndTextColor,
                )),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1 / 0.7,
                children: List.generate(
                    section.length, (index) =>defaultDoaaItem(model: section[index]),
                    growable: true)),
          )),
    );
  }

  Future loadData() async => DefaultAssetBundle.of(context)
      .loadString('assets/doaa_db.json')
      .then((value) {
    var response = json.decode(value);
    response.forEach((data) {
      DoaaModel _sectionDoaa = DoaaModel.fromJson(data);
      section.add(_sectionDoaa);
    });
    setState(() {});
  }).catchError((error) {
    print(error.toString());
  });
}
