import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim/ViewModel/AdhanAndQiblaCubit/AdhanAndQiblaCubit.dart';
import 'package:muslim/ViewModel/AdhanAndQiblaCubit/AdhanAndQiblaState.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  Future getPosition() async {
    bool? services;
    LocationPermission? permission;

    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    if (services == false) {
      const AlertDialog(
        title: Text('Location'),
        content: Text('Please enable Location'),
      );
    }

    permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always) {
        getLangAndLatit();
        print(pos?.latitude);
        print(pos?.longitude);
      }
    }
  }

  Future<Position> getLangAndLatit() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  @override
  void initState() {
    getPosition();
    getLangAndLatit();
    super.initState();
  }

  Position? pos;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdhanAndQiblaCubit()..getQibla(),
      child: BlocBuilder<AdhanAndQiblaCubit, QiblaStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                pos = await getLangAndLatit();
                print(pos?.latitude);
                print(pos?.longitude);
               await AdhanAndQiblaCubit.get(context).getQibla();
              },
              child: const Icon(Icons.location_on),
            ),
          );
        },
      ),
    );
  }
}
