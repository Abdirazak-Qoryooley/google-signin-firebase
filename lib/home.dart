import 'package:firebase_google_signin/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Future<void> signInWithGoogle() async {
    // ignore: unused_local_variable
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    // Trigger the Google Authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the Google Authentication credentials
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new Firebase Auth credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Google Auth credential
    // ignore: unused_local_variable
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // return userCredential;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('google signin'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                  if (mounted) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => profilepage()));
                  }
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              'flutter with Google sigin',
                              style: TextStyle(fontSize: 20),
                            ))
                      ],
                    ))),
          )
        ],
      )),
    );
  }
}
