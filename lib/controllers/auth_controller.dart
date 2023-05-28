import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:wiztok/constants.dart';
import 'package:wiztok/models/user.dart' as model;
import 'package:wiztok/views/screens/auth/login_screen.dart';
import 'package:wiztok/views/screens/homescreen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  late Rx<File?> _pickedImage;

  File? get profilePic => _pickedImage.value;
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture', 'Image selection Successful');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  // upload to firebase Storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePictures')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // register user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // register user to firebase
        UserCredential credential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
          name: username,
          profilePic: downloadUrl,
          email: email,
          uid: credential.user!.uid,
        );
        await firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
        Get.snackbar('User Register', 'New User Registeration Successful!');
      } else {
        Get.snackbar(
          'Error creating User',
          'Please enter all the fields!',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error creating User',
        e.toString(),
      );
    }
  }

  // LOGIN USER
  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar('Logged in', 'User Login Successful!');
        print('logged');
      } else {
        Get.snackbar(
          'Error logging User',
          'Please enter all fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Logging User',
        e.toString(),
      );
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}
