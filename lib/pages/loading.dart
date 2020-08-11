import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    //API Call
    WorldTime theTime = WorldTime(
        location: "New York", flag: "usa.flag", url: "America/New_York");
    await theTime.getTime();

    // Change page view
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": theTime.location,
      "flag": theTime.flag,
      "time": theTime.time,
      "isDaytime": theTime.isDaytime,
      "url": theTime.url
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ));
  }
}
