import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<User?> createAccount(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print('Registered Sucessfully');
      return user;
    } else {
      print('Account creation failed');
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();
  try {
    User? user = (await auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print('Login Sucessful');
      return user;
    } else {
      print('User registration denied');
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    await auth.signOut();
  } catch (e) {
    print("error");
  }
}

Future<void> verifyEmail() async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    user!.sendEmailVerification();
    log('Email verification has been sent', name: 'verification');
  } catch (e) {
    print(e);
  }
}

Future<bool> isEmailVerified() async {
  User? user = FirebaseAuth.instance.currentUser;
  await user!.reload();
  bool emailVerified = await user.emailVerified;
  try {
    if (emailVerified == true) {
      await FirebaseAuth.instance.currentUser?.getIdToken(true);
      log('Email is verified', name: 'verify');
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
