import 'package:flutter/material.dart';
import 'package:world_time_app/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: "Tokyo",
        flagUrl:
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/800px-Flag_of_Japan.svg.png",
        endpointUrl: "Asia/Tokyo"),
    WorldTime(
        location: "New York",
        flagUrl:
            "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png",
        endpointUrl: "America/New_York"),
    WorldTime(
        location: "Moscow",
        flagUrl:
            "https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/800px-Flag_of_Russia.svg.png",
        endpointUrl: "Asia/Moscow"),
    WorldTime(
        location: "Paris",
        flagUrl:
            "https://a-z-animals.com/media/2022/12/france-flag.jpg_s1024x1024wisk20cyD9gYZrvMOjkFMwERkfPEzPg7aLcde1efXnp-S4SS2M-1024x614.jpg",
        endpointUrl: "Europe/Paris"),
    WorldTime(
        location: "London",
        flagUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png",
        endpointUrl: "Europe/London")
  ];

  void updateTime(index) async {
    WorldTime instance1 = locations[index];
    await instance1.getTime();

    Navigator.pop(context, {
      'location': instance1.location,
      'time': instance1.time,
      'flagUrl': instance1.flagUrl,
      'isDaytime': instance1.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Locations"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(locations[index].flagUrl),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
