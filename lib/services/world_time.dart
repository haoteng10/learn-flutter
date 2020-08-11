import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String short;

  WorldTime({this.location, this.flag, this.short});

  Future<void> getTime() async {
    try {
      Response response =
          await get("http://worldclockapi.com/api/json/$short/now");
      Map data = jsonDecode(response.body);

      String dateTime = data["currentDateTime"];
      String offset = data["utcOffset"].substring(0, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      this.time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error on API Call");
      this.time = "Cannot retrieve the time. (Error on API Call)";
    }
  }
}
