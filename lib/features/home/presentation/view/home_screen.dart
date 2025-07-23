import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/core/widgets/custom_awesom_dialog_method.dart';
import 'package:firebase_learn/features/auth/login/presentation/view/login_screen.dart';
import 'package:firebase_learn/features/auth/widget/custom_appbar_widget.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/floating_widget.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../add_category/presentation/view/add_category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        floatingActionButton:  FloatingWidget(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (c){
            return const AddCategoryScreen();
          }));
          },
        ),
        appBar: AppBar(
          leading: const SizedBox(),
          flexibleSpace: CustomAppbarWidget(
            title: AppTexts.homePage,
            actionIcon: Icons.logout_outlined,
            actionOnPressed: () {
              CustomAwesomDialogMethod.awesomeDialog(
                  context: context,
                  title: "Warning",
                  desc: "Are you sure to logout...!",
                  dialogType: DialogType.warning,
                  btnOkColor: AppColors.green,
                  cancelOnPress: (){},
                  btnOkOnPress: (){
                    FirebaseAuth.instance.signOut();
                    GoogleSignIn googleSignIn = GoogleSignIn();
                    googleSignIn.disconnect();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                      return const LoginScreen();
                    }));
                  }
              );
            },
          ),
        ),
        body:const HomeBody()
    );
  }
}
