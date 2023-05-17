import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:obraj_break_tracker_user/ui/SignInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController{

  RxString id = ''.obs;
  RxString name = ''.obs;

  final Duration _duration = const Duration(minutes: 1);
  final Rx<Duration> _remainingTime = const Duration().obs;
  final RxString _formattedTime = ''.obs;
  Timer? _timer;
  DateTime? _pauseTime;

  Duration get remainingTime => _remainingTime.value;
  String get formattedTime => _formattedTime.value;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
    startTimer();
  }

  void getUserInfo() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id.value =  prefs.getString('userId') as String;
    name.value =  prefs.getString('userName') as String;
    if (kDebugMode) {
      print(id.value);
    }
  }

  void logout()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId','');
    await prefs.setString('userName','');
    Get.off(SignInScreen());
  }

  void startTimer() {
    _remainingTime.value = _duration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.value.inSeconds > 0) {
        _remainingTime.value = _remainingTime.value - const Duration(seconds: 1);
        _formattedTime.value = formatDuration(_remainingTime.value);
      } else {
        _timer?.cancel();
      }
    });
  }
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
  void pauseTimer() {
    _timer?.cancel();
    _timer = null;
    _pauseTime = DateTime.now();
  }

  void resumeTimer() {
    if (_timer == null && _pauseTime != null) {
      final pausedDuration = DateTime.now().difference(_pauseTime!);
      _remainingTime.value = _remainingTime.value - pausedDuration;
      _formattedTime.value = formatDuration(_remainingTime.value);
      startTimer();
    }
  }
}