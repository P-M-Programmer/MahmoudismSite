import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicplayer/pages/musicplayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 39, 39, 1),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 17.04,
            ),
            Stack(
              children:[
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        child: Center(
                          child: Text(
                            "MMC",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 96,
                              fontFamily: "Panton"
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                        ),
                    ),
                  )
                ),
                Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.22,
                        height: MediaQuery.of(context).size.height / 5.68,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(242, 242, 242, 0.1),
                                Color.fromRGBO(102, 102, 102, 0.1),
                              ],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                          )
                        ),
                        child: Center(
                          child: Text(
                            "بانک",
                            style: TextStyle(
                              fontFamily: "Morabba",
                              fontSize: 55,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(0, 200, 150, 1),
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 4,
                                  offset: Offset(0, 4)
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                Positioned(
                  top: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.07,
                      height: MediaQuery.of(context).size.height / 6.65,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/Tuhid.png",)
                        )
                      ),
                    )
                )
              ]
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 17.04,
            ),
            Stack(
                children:[
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Center(
                            child: Text(
                              "MUSIC",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 96,
                                  fontFamily: "Panton"
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                      )
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.22,
                            height: MediaQuery.of(context).size.height / 5.68,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(242, 242, 242, 0.1),
                                    Color.fromRGBO(102, 102, 102, 0.1),
                                  ],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                )
                            ),
                            child: Center(
                              child: Text(
                                "موزیک",
                                style: TextStyle(
                                    fontFamily: "Morabba",
                                    fontSize: 55,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(0, 200, 150, 1),
                                    shadows: [
                                      Shadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4,
                                          offset: Offset(0, 4)
                                      )
                                    ]
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 30,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.63,
                        height: MediaQuery.of(context).size.height / 5.68,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/headphone.png",)
                            )
                        ),
                      )
                  )
                ]
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 17.04,
            ),
            Stack(
                children:[
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Center(
                            child: Text(
                              "ENTER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 96,
                                  fontFamily: "Panton"
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                      )
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.22,
                            height: MediaQuery.of(context).size.height / 5.68,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(242, 242, 242, 0.1),
                                    Color.fromRGBO(102, 102, 102, 0.1),
                                  ],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                )
                            ),
                            child: Center(
                              child: Text(
                                "سرگرمی",
                                style: TextStyle(
                                    fontFamily: "Morabba",
                                    fontSize: 55,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(0, 200, 150, 1),
                                    shadows: [
                                      Shadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4,
                                          offset: Offset(0, 4)
                                      )
                                    ]
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 30,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.07,
                        height: MediaQuery.of(context).size.height / 6.65,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/Star.png",)
                            )
                        ),
                      )
                  )
                ]
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 17.04,
            ),
            Stack(
                children:[
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Center(
                            child: Text(
                              "QUEST",
                              style: TextStyle(
                                  color: Colors.white10,
                                  fontSize: 96,
                                  fontFamily: "Panton"
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                      )
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.22,
                            height: MediaQuery.of(context).size.height / 5.68,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(242, 242, 242, 0.1),
                                    Color.fromRGBO(102, 102, 102, 0.1),
                                  ],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                )
                            ),
                            child: Center(
                              child: Text(
                                "ماموریت",
                                style: TextStyle(
                                    fontFamily: "Morabba",
                                    fontSize: 55,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(0, 200, 150, 1),
                                    shadows: [
                                      Shadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4,
                                          offset: Offset(0, 4)
                                      )
                                    ]
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 35,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.93,
                        height: MediaQuery.of(context).size.height / 8.52,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/Calendar.png",)
                            )
                        ),
                      )
                  )
                ]
            ),
          ],
        ),
      ),
    );
  }
}


