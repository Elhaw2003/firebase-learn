import 'package:firebase_learn/core/app_routes/app_routes.dart';
import 'package:firebase_learn/features/update_category/presentation/view/update_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../features/add_category/data/model/category_model.dart';
import '../../features/add_category/data/repo/add_category_repo_firebase_implementation.dart';
import '../../features/add_category/presentation/controller/cubit/add_category_cubit.dart';
import '../../features/add_category/presentation/view/add_category_screen.dart';
import '../../features/add_note/data/repo/add_note_repo_firebase_implementation.dart';
import '../../features/add_note/presentation/controller/cubit/add_note_cubit.dart';
import '../../features/add_note/presentation/view/add_note_screen.dart';
import '../../features/auth/login/data/repo/forgot_password/forgot_password_repo_firebase_implementation.dart';
import '../../features/auth/login/data/repo/login_with_email_and_password/login_with_email_and_password_repo_implementation.dart';
import '../../features/auth/login/data/repo/login_with_google/login_with_google_repo_firebase_implementation.dart';
import '../../features/auth/login/presentation/controller/cubit/forgot_password/forgot_password_firebase_cubit.dart';
import '../../features/auth/login/presentation/controller/cubit/login_with_email_and_password/login_with_email_and_password_cubit.dart';
import '../../features/auth/login/presentation/controller/cubit/login_with_google/login_with_google_cubit.dart';
import '../../features/auth/login/presentation/view/login_screen.dart';
import '../../features/auth/register/data/repo/register_repo_implementation.dart';
import '../../features/auth/register/presentation/controller/cubit/register_cubit.dart';
import '../../features/auth/register/presentation/view/register_screen.dart';
import '../../features/home/data/repo/delete_category/delete_category_repo_firebase_implementation.dart';
import '../../features/home/data/repo/get_categories/get_categories_repo_firebase_implementation.dart';
import '../../features/home/presentation/controller/cubit/delete_category/delete_category_cubit.dart';
import '../../features/home/presentation/controller/cubit/get_categories/get_categories_cubit.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../features/note/data/repo/get_note_repo/get_notes_repo_firebase_implementation.dart';
import '../../features/note/presentation/controller/cubit/get_notes/get_notes_cubit.dart';
import '../../features/note/presentation/view/note_screen.dart';
import '../../features/update_category/data/repo/update_category_name_repo_firebase_implementation.dart';
import '../../features/update_category/presentation/controller/cubit/update_category_name_cubit.dart';
class RouterGenerator {
   static  GoRouter routerGeneration = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified   ? AppRoutes.homeScreen : AppRoutes.loginScreen,
    routes: [

      /// ---------------- Auth Screens ----------------
      GoRoute(
          path: AppRoutes.loginScreen,
          name: AppRoutes.loginScreen,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => LoginWithEmailAndPasswordCubit(
                      loginRepo:
                      LoginWithEmailAndPasswordRepoFirebaseImplementation())),
              BlocProvider(
                  create: (context) => LoginWithGoogleCubit(
                      loginWithGoogleRepo:
                      LoginWithGoogleRepoFirebaseImplementation())),
              BlocProvider(
                  create: (context) => ForgotPasswordFirebaseCubit(
                      forgotPasswordRepo:
                      ForgotPasswordRepoFirebaseImplementation())),
            ],
            child: const LoginScreen(),
          )
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        name: AppRoutes.registerScreen,
        builder: (context, state) => BlocProvider(
            create: (context) => RegisterCubit(registerRepo: RegisterRepoFirebaseImplementation()), child: const RegisterScreen()),
      ),

      /// ---------------- Home ----------------
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => MultiBlocProvider(
         providers: [
           BlocProvider( create: (_) => GetCategoriesCubit(
             getCategoriesRepo: GetCategoriesRepoFirebaseImplementation(),
           )..getCategoriesCubit(),),
           BlocProvider( create: (_) => DeleteCategoryCubit(deleteCategoryRepo: DeleteCategoryRepoFirebaseImplementation()),),
         ],
          child: const HomeScreen(),
        ),
      ),

      /// ---------------- Add Category ----------------
      GoRoute(
        path: AppRoutes.addCategoryScreen,
        name: AppRoutes.addCategoryScreen,
        builder: (context, state) => BlocProvider(
            create: (context) => AddCategoryCubit(addCategoryRepo: AddCategoryRepoFirebaseImplementation()),
            child: const AddCategoryScreen()),
      ),
      /// ---------------- Update Category ----------------
      GoRoute(
        path: AppRoutes.updateCategoryScreen,
        name: AppRoutes.updateCategoryScreen,
        builder: (context, state) {
          final CategoryModel category = state.extra as CategoryModel;
          return BlocProvider(
            create: (context) => UpdateCategoryNameCubit(updateCategoryNameRepo: UpdateCategoryNameRepoFirebaseImplementation()),
            child: UpdateCategoryScreen(oldName: category.categoryName, categoryId: category.categoryId!),
          );
        },
      ),
      /// ---------------- Note Screen ----------------
      GoRoute(
        path: AppRoutes.noteScreen,
        name: AppRoutes.noteScreen,
        builder: (context, state) {
          final categoryId = state.extra as String;
          return BlocProvider(create: (context) => GetNotesCubit(getNotesRepo: GetNotesRepoFirebaseImplementation())..getNotesCubit(categoryId: categoryId), child:  NoteScreen(categoryId: categoryId,));
        },
      ),

      /// ---------------- Add Note ----------------
      GoRoute(
        path: AppRoutes.addNoteScreen,
        name: AppRoutes.addNoteScreen,
        builder: (context, state) {
          final categoryId = state.extra as String;
          return BlocProvider(create: (context) => AddNoteCubit(addNoteRepo: AddNoteRepoFirebaseImplementation()), child:  AddNoteScreen(categoryId: categoryId,));
        },
      ),
    ],
  );
}