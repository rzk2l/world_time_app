import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location;
  late String time;
  late String flagUrl;
  late String endpointUrl;

  WorldTime(
      {required this.location,
      required this.flagUrl,
      required this.endpointUrl});

  Future<void> getTime() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/$endpointUrl'));
    Map timeData = jsonDecode(response.body);
    // print("${timeData["datetime"]}");

    String datetime = timeData['datetime'];
    String offset = timeData['utc_offset'].substring(0, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    // set time preperty
    time = now.toString();
  }
}
