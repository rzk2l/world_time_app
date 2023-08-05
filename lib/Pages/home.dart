import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    } catch (error) {
      data = data;
    }
    print(data);

    // Background
    String bgImage = data['isDaytime']
        ? "https://images.unsplash.com/photo-1556772219-94f40b530c1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80"
        : "https://images.unsplash.com/photo-1579096090620-304b0f9aef96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=383&q=80";
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(bgImage),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: data['isDaytime'] ? Colors.black : Colors.grey[300],
                  ),
                  label: Text(
                    "Edit location",
                    style: TextStyle(
                      color:
                          data['isDaytime'] ? Colors.black : Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color:
                              data['isDaytime'] ? Colors.black : Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 60,
                      letterSpacing: 2,
                      color: data['isDaytime'] ? Colors.black : Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
