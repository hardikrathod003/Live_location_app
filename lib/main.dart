import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Map_page.dart';
import 'global.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Homepage(),
      'Map_page': (context) => const map(),
    },
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  checkpermission() async {
    await Permission.location.request();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkpermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Live Location"),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("Get Live Location"),
                onPressed: () async {
                  Navigator.of(context).pushNamed('Map_page');
                  Geolocator.getPositionStream().listen(
                    (Position position) {
                      setState(() {
                        Global.lat = position.latitude;
                        Global.log = position.longitude;
                      });
                    },
                  );
                },
              ),
              Text("${Global.lat} , ${Global.log}")
            ],
          ),
        ));
  }
}
