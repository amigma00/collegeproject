import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Authorization extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user=>_user!;

  Future googleLogin() async {
   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
   if(googleUser == null) return;
   _user = googleUser;

   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

   final credential = GoogleAuthProvider.credential(
     accessToken: googleAuth.accessToken,
     idToken: googleAuth.idToken,
   );

   await FirebaseAuth.instance.signInWithCredential(credential);
   notifyListeners();

  }

}