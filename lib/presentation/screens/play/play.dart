import 'dart:async';

import 'package:bookapp_umg/data/common/bood_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bookapp_umg/data/source/repository/AppRepository.dart';
import 'package:flutter/material.dart';
import 'package:music_visualizer/music_visualizer.dart';

import '../../../utils/components/document_viewer_page.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final List<Color> colors = [
    const Color(0x40F26B6C),
    const Color(0xFFF26B6C),
    const Color(0xBFF26B6C),
    const Color(0x80F26B6C)
  ];

  AppRepository appRepository = AppRepositoryImpl();
  final List<int> duration = [3000, 2500, 2000, 1500, 1000];
  final _audioPlayer = AudioPlayer();
  var isPlay = true;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, BookModel?>;
    final data = args["book"];
    if (isPlay) {
      _audioPlayer.play(UrlSource(data!.audio));
    } else {
      _audioPlayer.pause();
    }
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/images/ellipse.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'main');
                    },
                    child: Image.asset("assets/images/arrowback.png",
                        color: Colors.white),
                  ),
                  Text(
                    'Now Playing',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.more_vert, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: InkWell(
                  onTap: () {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDF()));

                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(data!.image,
                        width: 195, height: 275, fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Text(
                data.title,
                style: TextStyle(
                  color: const Color(0xFF787878),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                data.author,
                style: TextStyle(
                  color: const Color(0xFF787878),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 240,
                height: 60,
                child: MusicVisualizer(
                  barCount: 30,
                  colors: colors,
                  duration: duration,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.skip_previous_outlined, size: 32),
                      SizedBox(width: 30),
                      Icon(Icons.keyboard_double_arrow_left_outlined, size: 32),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (isPlay) {
                        _audioPlayer.pause();
                      } else {
                        _audioPlayer.play(UrlSource(data.audio));
                      }
                      setState(() {
                        isPlay = !isPlay;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0x80F26B6C),
                          borderRadius: BorderRadius.circular(52)),
                      child: Icon(
                        isPlay ? Icons.pause : Icons.play_arrow,
                        color: const Color(0xFFF26B6C),
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.skip_next_outlined, size: 32),
                      SizedBox(width: 30),
                      Icon(Icons.keyboard_double_arrow_right_outlined,
                          size: 32),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 84,
            decoration: const ShapeDecoration(
              color: Color(0x0CF26A6B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Icon(
                  Icons.keyboard_double_arrow_up,
                  size: 35,
                  color: Color(0xFFF26B6C),
                ),
                Text(
                  'CHAPTER',
                  style: TextStyle(
                    color: const Color(0xFFF26B6C),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    super.dispose();
  }

  bool isButtonDisabled = false;

  void onPressed() {
    if (!isButtonDisabled) {
      setState(() {
        isButtonDisabled = true;
      });
      Timer(Duration(seconds: 5), () {
        setState(() {
          isButtonDisabled = false;
        });
      });
    }
  }
}
