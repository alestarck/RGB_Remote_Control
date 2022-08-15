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
  //
  Widget Button(BuildContext context, String color, String text, double sizeText, String idCod) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.18,
        height: MediaQuery.of(context).size.height * 0.08,
        margin: const EdgeInsets.only(bottom: 0, left: 12, right: 0, top: 10),
        decoration: BoxDecoration(
            color: Color(int.parse(color)),
            borderRadius: const BorderRadius.all(Radius.circular(50.0))),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: sizeText),
        )),
      ),
      onTap: () {
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
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border(top: BorderSide.none, bottom: BorderSide.none)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFFEFEFF", "+",22, "+"),
                    Button(context, "0xFFFEFEFF", "-",22, "-"),
                    Button(context, "0xFF212029", "OFF",22, "OFF"),
                    Button(context, "0xFFFEF2D32", "ON",22, "ON"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFEC2E33", "R",22, "R"),
                    Button(context, "0xFF028048", "G",22, "G"),
                    Button(context, "0xFF1A4CA5", "B",22, "B"),
                    Button(context, "0xFFFEFEFF", "W",22, "W"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFED5432", "",0, "R1"),
                    Button(context, "0xFF479E48", "",0, "G1"),
                    Button(context, "0xFF1F89EB", "",0, "B1"),
                    Button(context, "0xFF666E7E", "FLASH",16, "FLASH"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFE87928", "",0, "R2"),
                    Button(context, "0xFF4CB6DD", "",0, "G2"),
                    Button(context, "0xFF7A2155", "",0, "B2"),
                    Button(context, "0xFF666E7E", "STROBE",16, "STROBE"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFEFBB4D", "",0, "R3"),
                    Button(context, "0xFF029AD9", "",0, "G3"),
                    Button(context, "0xFFAD1D5A", "",0, "B3"),
                    Button(context, "0xFF666E7E", "FADE",16, "FADE"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(context, "0xFFF9E828", "",0, "R4"),
                    Button(context, "0xFF0278B5", "",0, "G4"),
                    Button(context, "0xFFD4517B", "",0, "B4"),
                    Button(context, "0xFF666E7E", "SMOOTH",16, "SMOOTH"),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
