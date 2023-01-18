import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:muslim/Model/AzkarModel/AzkaarModel.dart';
import 'package:muslim/Widgets/defaultAzkarItem.dart';
import 'package:muslim/constant/AppColor.dart';

class AzkarHomePage extends StatefulWidget {
  const AzkarHomePage({Key? key}) : super(key: key);

  @override
  _AzkarHomePageState createState() => _AzkarHomePageState();
}

class _AzkarHomePageState extends State<AzkarHomePage> {
  List<AzkarDataItem> section = [];

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
                'ألأذكار',
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
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 17,
                crossAxisSpacing: 18,
                childAspectRatio: 1 / 0.8,
                children: List.generate(
                    section.length, (index) =>defaultAzkarItem(model: section[index]),
                    growable: true)),
          )),
    );
  }

  Future loadData() async => DefaultAssetBundle.of(context)
        .loadString('assets/sections_db.json')
        .then((value) {
      var response = json.decode(value);
      response.forEach((data) {
        AzkarDataItem _section = AzkarDataItem.fromJson(data);
        section.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
}
