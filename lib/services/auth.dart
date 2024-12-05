import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> emailSignIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emailSignUp(email, password);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: 'Invalid Credentials.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
    }
  }

  Future<void> emailSignUp(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await sendEmailVerification(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendEmailVerification(User? user) async {
  if (user != null && !user.emailVerified) {
    await user.sendEmailVerification();
  }
}

  Future<void> checkEmailVerification() async {
    await user?.reload();
    if (user != null && user!.emailVerified) {
      print('Email is verified');
    } else {
      print('Email is not verified');
    }
  }

  Future<void> googleSignIn() async {
    try {
      final googleSignIn = await GoogleSignIn().signIn();

      if (googleSignIn == null) return;
      final googleAuth = await googleSignIn.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> signOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }
}
