import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class profilepage extends StatelessWidget {
  const profilepage({super.key});

  Future<void> signout() async {
    // ignore: unused_local_variable
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                await signout();
                Navigator.pop(context);
              },
              child: Center(child: Text('Signout')))
        ],
      ),
    );
  }
}
