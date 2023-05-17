import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obraj_break_tracker_user/ui/SignInScreen.dart';

const apiKey = 'AIzaSyA0LdEJcEb4LyHfKWRijMIgB1C7t_yghL8';
const projectId = 'obrajbreaktracker';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.initialize(projectId);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
    );
  }
}

