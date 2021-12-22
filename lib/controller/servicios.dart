import 'dart:ffi';

import 'package:caase_app/ui/page/homePage.dart';
import 'package:caase_app/ui/page/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:caase_app/ui/page/homePage.dart';
import 'package:caase_app/ui/page/loginPage.dart';
import 'package:caase_app/ui/page/resetPassword.dart';

class Service {
  final auth = FirebaseAuth.instance;

  void CreateUser(context, email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()))
              });
    } catch (e) {
      errorbox(context, e.toString());
    }
  }

  void errorbox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e),
          );
        });
  }

  void loginUser(context, email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()))
              });
    } catch (e) {
      errorbox(context, e.toString());
    }
  }

  void resetPassword(context, email) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()))
          });
    } catch (e) {
      errorbox(context, e.toString());
    }
  }

  void signOut(context) async {
    try {
      await auth.signOut().then((value) => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()))
          });
    } catch (e) {
      errorbox(context, e.toString());
    }
  }
}
