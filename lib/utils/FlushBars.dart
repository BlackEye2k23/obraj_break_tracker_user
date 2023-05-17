import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlushBar{


  showErrorFlush(String message){
    Flushbar(
      message: message,
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.red,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Colors.red,
    ).show(Get.context!);
  }
}