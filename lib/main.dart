// ignore_for_file: use_key_in_widget_constructors, unused_import, avoid_web_libraries_in_flutter

import 'package:controle_rgb/Remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageWidget();
  }
}

class HomePageWidget extends State<HomePage> {
  void initState() {
    super.initState();
  }

  Widget Button(BuildContext context, String color, String text, String idCod) {
    return RawMaterialButton(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.18,
        height: MediaQuery.of(context).size.height * 0.08,
        margin: const EdgeInsets.only(bottom: 0, left: 12, right: 0, top: 10),
        decoration: BoxDecoration(
            color: Color(int.parse(color)),
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
      onPressed: () {
        Remote().SetRemote(idCod);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Controle RGB"),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFFEFEFF", "+", "+"),
                    Button(context, "0xFFFEFEFF", "-", "-"),
                    Button(context, "0xFF212029", "OFF", "OFF"),
                    Button(context, "0xFFFEF2D32", "ON", "ON"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFEC2E33", "R", "R"),
                    Button(context, "0xFF028048", "G", "G"),
                    Button(context, "0xFF1A4CA5", "B", "B"),
                    Button(context, "0xFFFEFEFF", "W", "W"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFED5432", "", "R1"),
                    Button(context, "0xFF479E48", "", "G1"),
                    Button(context, "0xFF1F89EB", "", "B1"),
                    Button(context, "0xFF666E7E", "FLASH", "FLASH"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFE87928", "", "R2"),
                    Button(context, "0xFF4CB6DD", "", "G2"),
                    Button(context, "0xFF7A2155", "", "B2"),
                    Button(context, "0xFF666E7E", "STROBE", "STROBE"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFEFBB4D", "", "R3"),
                    Button(context, "0xFF029AD9", "", "G3"),
                    Button(context, "0xFFAD1D5A", "", "B3"),
                    Button(context, "0xFF666E7E", "FADE", "FADE"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFF9E828", "", "R4"),
                    Button(context, "0xFF0278B5", "", "G4"),
                    Button(context, "0xFFD4517B", "", "B4"),
                    Button(context, "0xFF666E7E", "SMOOTH", "SMOOTH"),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
