import 'package:world_time/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time= "Loading...";

  void setupWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin');
    (await instance.getTime());
    Navigator.pushReplacementNamed(context, '/home',
    arguments: {
        'location':instance.location,
        'flag': instance.flag,
        'time':instance.time,
        'isDayTime':instance.isDayTime,
        });
  }

  @override
  void initState()
  {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child:SpinKitRing(
          color: Colors.black,
          size: 50.0,
        ),
      )
    );
  }
}

