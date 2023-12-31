import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flagUrl;
  late String endpointUrl;
  late bool isDaytime;

  WorldTime(
      {required this.location,
      required this.flagUrl,
      required this.endpointUrl});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/$endpointUrl'));
      Map timeData = jsonDecode(response.body);
      // print("${timeData["datetime"]}");

      String datetime = timeData['datetime'];
      String offset = timeData['utc_offset'].substring(0, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      // set time preperty
      time = DateFormat.jm().format(now);
    } catch (error) {
      time = "Couldn't get time";
    }
  }
}
