import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:wiztok/constants.dart';
import 'package:wiztok/models/video.dart';

class UploadVideoController extends GetxController {
  // COMPRESS VIDEO
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    return compressedVideo!.file;
  }

  // UPLOAD VIDEO TO STORAGE
  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downlodUrl = await snapshot.ref.getDownloadURL();
    return downlodUrl;
  }

  // GENERATE THUMBNAIL
  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  // UPLOAD IMAGE TO STORAGE
  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);

    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downlodUrl = await snapshot.ref.getDownloadURL();
    return downlodUrl;
  }

  // UPLOAD VIDEO FUNCTION
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      // GET ID
      var alldocs = await firestore.collection('videos').get();
      int len = alldocs.docs.length;

      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      String thumbnail = await _uploadImageToStorage("video $len", videoPath);

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: 'Video $len',
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        caption: caption,
        videoUrl: videoUrl,
        thumbnail: thumbnail,
        profilePic: (userDoc.data()! as Map<String, dynamic>)['profilePic'],
      );

      await firestore
          .collection('videos')
          .doc('Video $len')
          .set(video.toJson());
      Get.back();
      Get.snackbar('Successful!', "Video uploaded successfully!");
    } catch (e) {
      Get.snackbar(
        'Error uploading!',
        e.toString(),
      );
    }
  }
}
