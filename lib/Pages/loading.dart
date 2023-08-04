import 'package:flutter/material.dart';
import 'package:world_time_app/Services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "New York",
        flagUrl: "flagUrl",
        endpointUrl: 'Africa/Algiers');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flagUrl': instance.flagUrl
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Text("loading..."),
      ),
    );
  }
}
