import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    //API Call
    WorldTime theTime =
        WorldTime(location: "New York", flag: "usa.flag", short: "est");
    await theTime.getTime();

    //Change page view
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": theTime.location,
      "flag": theTime.flag,
      "time": theTime.time
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Loading..."),
        ),
      ),
    );
  }
}
