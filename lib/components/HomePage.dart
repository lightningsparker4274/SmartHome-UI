import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartui/utils/smart_device_box.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //pading constants
  final double hP = 40;
  final double vP = 25;

  //List of smart Devices
  List mySmartDevices = [
    ["Smart Light", "asset/images/light_bulb.svg", true],
    ["Smart AC", "asset/images/air-conditioner.svg", false],
    ["Smart TV", "asset/images/smart_fan.svg", true],
    ["Smart FAN", "asset/images/smart_tv.svg", false],
  ];

  powerSwitchedOn(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Custom app bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hP, vertical: vP),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Icon(Icons.menu, size: 45),
                  Icon(Icons.person, size: 45)
                  //account icon
                ],
              ),
            ),

            const SizedBox(height: 20.0),

            //Weklcome Home
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  Text("Welcome Home",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  Text("SkyBrook", style: TextStyle(fontSize: 40))
                ],
              ),
            ),

            const SizedBox(height: 25.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: hP),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),

            const SizedBox(height: 25.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: hP),
              child: Text("Smart Devices",
                  style: GoogleFonts.sofia(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),

            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  //physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return SmartDevicebox(
                      smart_device_name: mySmartDevices[index][0],
                      smart_device_image: mySmartDevices[index][1],
                      power_sts: mySmartDevices[index][2],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => powerSwitchedOn(value, index),
                    );
                  }),
            )),

            //Smart Devices Grid
          ],
        ),
      ),
    );
  }
}
