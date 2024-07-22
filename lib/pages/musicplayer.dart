import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';

class Musicplayer extends StatefulWidget {
  const Musicplayer({super.key});

  @override
  State<Musicplayer> createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState(){
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state){
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration){
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition){
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    // audioPlayer.setReleaseMode(ReleaseMode.loop);
    //
    // final result = await FilePicker.platform.pickFiles();
    //
    // if(result != null){
    //   final file = File(result.files.single.path!);
    //   audioPlayer.setSourceUrl(file.path);
    // }

    final player = AudioCache(prefix: "assets/audio/");
    final url = await player.load("noskhe.mp3");
    audioPlayer.setSourceUrl(url.path);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/nasakh.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child:  BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 65),
                              child: Container(

                                height: MediaQuery.of(context).size.height / 1.30,
                                width: MediaQuery.of(context).size.width / 1.18,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.38),
                                    borderRadius: BorderRadius.circular(55),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          color: Colors.black.withOpacity(0.25),
                                          offset: Offset(0, 4)
                                      )
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width / 1.18 / 1.18,
                                      height: MediaQuery.of(context).size.width / 1.18 / 1.18,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(29),
                                          image: DecorationImage(
                                            image: AssetImage('images/nasakh.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 4,
                                                color: Colors.black.withOpacity(0.25),
                                                offset: Offset(0, 4)
                                            )
                                          ]
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "نسخ نسخه",
                                      style: TextStyle(
                                        color: Color.fromRGBO(2, 57, 57, 1),
                                        fontFamily: "Morabba",
                                        fontWeight: FontWeight.w900,
                                        fontSize: 40,

                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width / 1.18 / 1.18,
                                      height: 8,
                                      color: Color.fromRGBO(2, 57, 57, 1),
                                    ),
                                    SizedBox(
                                      height: 44,
                                    ),

                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Expanded(
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    "1401",
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(2, 57, 57, 1),
                                                      fontFamily: "Morabba",
                                                      fontWeight: FontWeight.w200,
                                                      fontSize: 20,

                                                    ),
                                                  ),
                                                ),
                                              )
                                          ),
                                          Center(
                                            child: Container(
                                              width: 8,
                                              color: Color.fromRGBO(2, 57, 57, 1),
                                            ),
                                          ),
                                          Expanded(
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    "هیپهاپولوژیست",
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(2, 57, 57, 1),
                                                      fontFamily: "Morabba",
                                                      fontWeight: FontWeight.w200,
                                                      fontSize: 20,

                                                    ),
                                                  ),
                                                ),
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                    Slider(
                                      min: 0,
                                      max: duration.inSeconds.toDouble(),
                                      value: position.inSeconds.toDouble(),
                                      onChanged: (value) async {
                                        final position = Duration(seconds: value.toInt());
                                        await audioPlayer.seek(position);
                                      },
                                      activeColor: Color.fromRGBO(2, 57, 57, 1),
                                      inactiveColor: Color.fromRGBO(57, 104, 104, 1),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            formatTime(position),
                                            style: TextStyle(
                                              color: Color.fromRGBO(2, 57, 57, 1),
                                              fontFamily: "Morabba",
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15,

                                            ),

                                          ),
                                          Text(
                                            formatTime(duration),
                                            style: TextStyle(
                                              color: Color.fromRGBO(2, 57, 57, 1),
                                              fontFamily: "Morabba",
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15,

                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(child: Container(),flex: 9,),
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                            minRadius: 10,
                            child: IconButton(
                              iconSize: 65,
                              color: Colors.white,
                              onPressed: () async {
                                if(isPlaying){
                                  await audioPlayer.pause();
                                }else{
                                  await audioPlayer.resume();
                                }
                              },
                              icon: Icon(
                                  isPlaying ?  Icons.pause_rounded : Icons.play_arrow_rounded
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    )

                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}

String formatTime(Duration duration){
  String twoDigits(int n) => n.toString().padLeft(2,"0");
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}