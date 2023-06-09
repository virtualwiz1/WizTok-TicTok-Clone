import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wiztok/controllers/upload_video_controller.dart';

import 'package:wiztok/views/widgets/text_input_field.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  const ConfirmScreen({
    super.key,
    required this.videoFile,
    required this.videoPath,
  });

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();

  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            child: VideoPlayer(controller),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      textController: _songController,
                      labelText: 'Song Name',
                      icon: Icons.music_note,
                      isObscured: false,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      textController: _captionController,
                      labelText: 'Caption',
                      icon: Icons.closed_caption,
                      isObscured: false,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        uploadVideoController.uploadVideo(
                          _songController.text,
                          _captionController.text,
                          widget.videoPath,
                        );
                      },
                      child: Text(
                        'Share',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
