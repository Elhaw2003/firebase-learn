import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_learn/core/widgets/custom_awesom_dialog_method.dart';
import 'package:firebase_learn/features/home/presentation/controller/cubit/pick_image/pick_image_cubit.dart';
import 'package:firebase_learn/features/home/presentation/view/home_screen.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/sheet_bottom_pick_image_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    print("============================$token");
  }

  notificationForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📩 Notification received in foreground");

      String? title;
      String? body;

      if (message.notification != null) {
        title = message.notification!.title;
        body = message.notification!.body;
      } else if (message.data.isNotEmpty) {
        title = title;
        body = body;
      }

      if (title != null && body != null) {
        print("💬 Title: $title");
        print("💬 Body: $body");

        CustomAwesomDialogMethod.awesomeDialog(
          context: context,
          title: title,
          desc: body,
          dialogType: DialogType.info,
        );
      } else {
        print("❗ No valid notification payload found.");
      }
    });
  }

  Future<void> sendPushNotification(
      {required String token, // FCM token للجهاز
      required String accessToken,
      required String title,
      required String content}) async {
    final url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/fir-learn-64907/messages:send');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    final body = {
      'message': {
        'token': token,
        'notification': {
          'title': title,
          'body': content,
        },
      }
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if(message.data["type"] == "category"){
        Navigator.push(context, MaterialPageRoute(builder: (c){
          return const HomeScreen();
        },),);
      }
      print("===========================${message.notification!.title}");
    });
    notificationForeground();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<PickImageCubit, PickImageState>(
        builder: (context, state) {
          var imageCubit = BlocProvider.of<PickImageCubit>(context);
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  // showBottomSheet(
                  //   backgroundColor: AppColors.borderTextFieldColor,
                  //   context: context,
                  //   builder: (context) =>  SheetBottomPickImageWidget(pickImageCubit: imageCubit,),
                  // );
                  sendPushNotification(
                      token:
                          "eXmcIB13Ql6-A2Nrcx5Ehc:APA91bEER5MSaHEgRFglgIkL2aoUvqHGCY4slWzUMpDkkNC_b3jb2MVlq191jvAY64mlg9FFUKBwL9AG4Sv4zmAKFNxVNowfn2Te46zPsmW1A03UTrsRk1A",
                      accessToken: "ya29.c.c0ASRK0GZgVGqzi3LwsYgCSsrlD4cy_-wY3KXWD_G1t3VHz3pn3Y6GaHvjnU5wumPpIe07Hq21hpUk5oKY0hoSBqAWbUgXB1UzCxOWo-35Qkd5F3mEfMCLy9-7QI9Bl0Ht7nECgk3vAO9SJuDp1FK2yGvNT7CJLIzaKIfeA5BZzNWrtW2naCrFf9xAizlcOXxB5QDNZpPqD3XBVRRUaLhio03kQOzgYWnKk7gerAtjT5i3-1kSnES7Y_rHlgZb3vJZV6g9dd37WtcXvb1AYifYuQr0t-Ps_xmgbKqSc9Z88lltpLW7RjJdzIjpVO_q4ZgM_TwY59tSIhx8CODpdHj_4tKLy2eWkxvmWYsknOPWXgF0bdQSlDfZid6yL385CB03g-W7W7Qzu4FYlVyoWXvtl0Bs_4BcdWy3V_o1u1wcxhq3Y1e38hRBo-eecZIzMsa-Wspp_ZsglyX--gU75_bZ0XyOgk6hcIq80Mlo1Xf80hX2UsqBf_Il2BnBQpl3V0yeZRFSjJtSJen4kRaIQ3XyqhM0vk-t1SWstMow9UqBJ1jsWWwaM0eQSt5Rgzkjgf_9voVtaFj05iudwqaBZn1VOzq853Mj0iM7g_j79pub_saIWkcZVebvFOUu0X28Uyn9ygqkBUcf6gzvQn2_sYiWkxFvdmYx8_7zb3Msir08xbJ9JRzj-ohlOmceJi1yxpulapgc1x9X4_wXQYs80OScpt6FQpJtBkR7e180qWeil-iiymZSlZie87XBqilkbsUs6WW8gacW4qodghZR8je38_FfVpm5XBmS9eh8gySRQ7OOWpze58bmdB8khy0XroRkVX4ofZWQtYdJl4v9az-jkRIwWXJMB_u3JZzSQhM_1MVttmn89Sa9z4MZBRV35cB2-67RX97s78t9dmWzh9e5pbc-1VQkpn_63lzs6y7wrsl1sO2oga_mOZBU8a-4t01elWRYra5Bhfu2l60Rx-iQhlnFF0x6Mme5twjJWyIwzrp1_-B8ItgOSkf",
                      title: "Hello Ibrahim",
                      content: "This is a test notification");
                },
                child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: imageCubit.image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.file(
                              File(imageCubit.image!.path),
                              fit: BoxFit.fill,
                            ))
                        : const Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: AppColors.primaryColor,
                          )),
              )
            ],
          );
        },
      ),
    );
  }
}
//: ClipRRect(
//                 borderRadius: BorderRadius.circular(80),
//                 child: Image.file(
//                   File(imageCubit.image!.path),
//                   fit: BoxFit.cover,
//                 )),
