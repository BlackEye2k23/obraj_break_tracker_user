import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obraj_break_tracker_user/controllers/HomeScreenController.dart';

class HomeScreen extends GetView<HomeScreenController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeScreenController(),
        builder: (controller){
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                    child: SizedBox(
                      width: Get.width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Image(image: AssetImage('assets/icons/app_logo.jpg')),
                          InkWell(
                            onTap: () {
                              controller.logout();
                            },
                            child: Container(
                              width: 100,
                              height: Get.height * 1,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10000),
                                boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 5), // Shadow position
                                ),
                                ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Logout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  Icon(Icons.logout,color: Colors.white,)
                                ],
                              ).paddingSymmetric(horizontal: 8),
                            ).marginSymmetric(vertical: 18,horizontal: 16),
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                  flex: 9,
                    child: SizedBox(
                      width: Get.width * 1,
                      height: Get.height * 1,
                      child: Center(),
                    )
                ),
              ],
            ),
          );
        }
    );
  }

}