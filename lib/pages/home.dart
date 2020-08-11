import 'package:flutter/material.dart';
import 'dart:async';
import 'package:world_time_app/services/world_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  Timer timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print("1: $data");

    try {
      // Set background based on isDaytime variable
      String bgImage = data["isDaytime"] ? "day.png" : "night.png";
      Color bgColor = data["isDaytime"] ? Colors.blue : Colors.indigo;

      if (timer == null) {
        timer = Timer.periodic(Duration(seconds: 15), (timer) async {
          WorldTime instance = WorldTime(
              location: data["location"], flag: data["flag"], url: data["url"]);
          await instance.getTime();
          setState(() {
            data = {
              "location": instance.location,
              "flag": instance.flag,
              "time": instance.time,
              "isDaytime": instance.isDaytime,
              "url": instance.url
            };
          });
        });
      }

      return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("./assets/$bgImage"), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, "/location");
                      if (result != null) {
                        setState(() {
                          data = {
                            "time": result["time"],
                            "location": result["location"],
                            "isDaytime": result["isDaytime"],
                            "flag": result["flag"],
                            "url": result["url"]
                          };
                        });
                      }
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text("Edit Location",
                        style: TextStyle(color: Colors.white))),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data["location"],
                      style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data["time"],
                  style: TextStyle(fontSize: 44.0, color: Colors.white),
                )
              ],
            ),
          ),
        )),
      );
    } catch (e) {
      return Scaffold(
        body: SafeArea(
          child: Text("Invalid Call"),
        ),
      );
    }
  }
}
