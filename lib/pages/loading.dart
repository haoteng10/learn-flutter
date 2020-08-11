import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String currentTime = "loading";

  void getData() async {
    WorldTime theTime =
        WorldTime(location: "New York", flag: "usa.flag", short: "est");
    await theTime.getTime();
    setState(() {
      currentTime = theTime.time;
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
          padding: const EdgeInsets.all(8.0),
          child: Text(currentTime),
        ),
      ),
    );
  }
}
