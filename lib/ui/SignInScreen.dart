import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:obraj_break_tracker_user/controllers/SignInScreenController.dart';

class SignInScreen extends GetView<SignInScreenController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignInScreenController(),
        builder: (controller){
        return Scaffold(
          body: SizedBox(
            width: Get.width * 1,
            height: Get.height * 1,
            child:Column(
              children: [
                const Image(image: AssetImage('assets/icons/app_logo.jpg')).marginOnly(top: 16),
                const Text('Break Tracker User',style: TextStyle(fontWeight: FontWeight.bold),).marginOnly(bottom: 28),
                Expanded(
                  child: SizedBox(
                    width: Get.width * .2,
                    child: Form(
                      key: controller.form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User Name',style: TextStyle(fontWeight: FontWeight.bold),),
                          TextFormField(
                            controller: controller.nameController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter User Name';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter User Name'
                            ),
                          ),
                          const SizedBox(height: 24,),
                          Text('User Password',style: TextStyle(fontWeight: FontWeight.bold),),
                          TextFormField(
                            controller: controller.passwordController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter User Password';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter User Password'
                            ),
                          ),
                          const SizedBox(height: 24,),

                          SizedBox(
                            width: Get.width * 1,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: (){
                                  if(controller.form.currentState!.validate()){
                                    // controller.addUserFirestore(controller.nameController.text,
                                    //     controller.passwordController.text,context);
                                    controller.signIn(controller.nameController.text,controller.passwordController.text);
                                  }
                                },
                                child: const Text('Login')
                            ),
                          )
                        ],
                      ).paddingOnly(bottom: 100),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        }
    );
  }

}