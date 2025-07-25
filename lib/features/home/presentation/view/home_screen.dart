import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/utilies/app_colors.dart';
import 'package:firebase_learn/core/utilies/app_texts.dart';
import 'package:firebase_learn/core/widgets/custom_awesom_dialog_method.dart';
import 'package:firebase_learn/features/auth/login/presentation/view/login_screen.dart';
import 'package:firebase_learn/features/auth/widget/custom_appbar_widget.dart';
import 'package:firebase_learn/features/home/data/repo/delete_category/delete_category_repo_firebase_implementation.dart';
import 'package:firebase_learn/features/home/data/repo/get_categories/get_categories_repo_firebase_implementation.dart';
import 'package:firebase_learn/features/home/presentation/controller/cubit/delete_category/delete_category_cubit.dart';
import 'package:firebase_learn/features/home/presentation/controller/cubit/get_categories/get_categories_cubit.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/floating_widget.dart';
import 'package:firebase_learn/features/home/presentation/view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../add_category/presentation/view/add_category_screen.dart';
import '../../../update_category/data/repo/update_category_name_repo_firebase_implementation.dart';
import '../../../update_category/presentation/controller/cubit/update_category_name_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetCategoriesCubit(getCategoriesRepo: GetCategoriesRepoFirebaseImplementation())..getCategoriesCubit(),),
        BlocProvider(create: (context) => DeleteCategoryCubit(deleteCategoryRepo: DeleteCategoryRepoFirebaseImplementation()),),
      ],
      child: Scaffold(
          backgroundColor: AppColors.white,
          floatingActionButton: FloatingWidget(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
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
                    cancelOnPress: () {},
                    btnOkOnPress: () {
                      FirebaseAuth.instance.signOut();
                      GoogleSignIn googleSignIn = GoogleSignIn();
                      googleSignIn.disconnect();
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (c) {
                        return const LoginScreen();
                      }));
                    }
                );
              },
            ),
          ),
          body: const HomeBody()
      ),
    );
  }
}
