import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get("https://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      String dateTime = data["datetime"];
      String offset = data["utc_offset"].substring(0, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      this.isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      this.time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error on API Call");
      this.time = "Cannot retrieve the time.";
    }
  }
}
