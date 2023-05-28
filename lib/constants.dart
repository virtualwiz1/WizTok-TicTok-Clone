import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:wiztok/controllers/auth_controller.dart';
import 'package:wiztok/views/screens/add_video_screen.dart';
import 'package:wiztok/views/screens/profile_screen.dart';
import 'package:wiztok/views/screens/search_screen.dart';
import 'package:wiztok/views/screens/video_screen.dart';

// PAGES
List pages = [
  VideoScreen(),
  SearchScreen(),
  AddVideoScreen(),
  Text('Inbox Screen'),
  ProfileScreen(uid: authController.user.uid),
];

// Colors
const backgroundColor = Colors.black;
const buttonColor = Color.fromRGBO(135, 84, 255, 1);
const borderColor = Colors.grey;

// FIREBASE CONSTANTS
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
