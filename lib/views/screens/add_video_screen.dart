import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiztok/constants.dart';
import 'package:wiztok/views/screens/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(videoFile: File(video.path), videoPath: video.path, ),
        ),
      );
    }
  }

  showOptionsDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.gallery, context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.image),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.camera, context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.camera_alt),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.cancel),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showOptionsDialog(context);
          },
          child: Container(
            height: 50,
            width: 190,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
