import 'package:firedart/firestore/firestore.dart';
import 'package:firedart/firestore/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obraj_break_tracker_user/ui/HomeScreen.dart';
import 'package:obraj_break_tracker_user/utils/FlushBars.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreenController extends GetxController {

  final form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final CollectionReference _usersCollection =
  Firestore.instance.collection('users');


  @override
  void onInit() {
    // TODO: implement onInit
    checkUserLogin();
    super.onInit();
  }


//     Future<UserData?> getUserDataByUsername(String username) async {
//       final querySnapshot = await _usersCollection
//           .where('userName', isEqualTo: username)
//           .limit(1)
//           .get();
//
//       if (querySnapshot.isNotEmpty) {
//         final documentSnapshot = querySnapshot.first;
//         final userData = UserData(
//           userId: documentSnapshot['userId'] as String,
//           userName: documentSnapshot['userName'] as String,
//           userPassword: documentSnapshot['userPassword'] as String,
//         );
//         print(userData.userName);
//         print(userData.userId);
//         print(userData.userPassword);
//       } else {
//         FlushBar().showErrorFlush('Wrong Name or this account does not exist') ;// User with the provided username doesn't exist
//       }
//     }
//
// }
  void signIn(String name, String password) async {
    final querySnapshot = await _usersCollection
        .where('userName', isEqualTo: name)
        .where('userPassword', isEqualTo: password)
        .limit(1)
        .get();

    if (querySnapshot.isNotEmpty) {
      final userDocument = querySnapshot.first;
      final userId = userDocument['userId'] as String;
      final userName = userDocument['userName'] as String;
      saveUserData(userId,userName);
      print('User ID: $userId');
      print('Username: $userName');
    } else {
      FlushBar().showErrorFlush('Invalid username or password');
    }
  }

  void saveUserData(String userId, String userName)async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
    await prefs.setString('userName', userName);
    Get.off(HomeScreen());
  }

  void checkUserLogin()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('userId');
    if(uid != null && uid != ''){
      Get.off(HomeScreen());
    }
  }
}