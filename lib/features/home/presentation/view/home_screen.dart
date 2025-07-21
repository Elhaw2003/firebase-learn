import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/utilies/app_texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: TextButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          GoogleSignIn googleSignIn = GoogleSignIn();
          googleSignIn.disconnect();
        },
        child: Text("signOut"),
          ),
    )
    );
  }
}
