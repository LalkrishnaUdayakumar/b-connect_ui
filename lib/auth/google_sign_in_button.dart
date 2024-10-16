import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatelessWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final user = await signInWithGoogle();
        if (user != null) {
          // You can handle successful sign-in here, e.g., navigate to another screen or show a message.
          // print("User signed in: \${user.displayName}");
        }
      },
      child: const Text("Sign in with Google"),
    );
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Create a new credential (optional, if using Firebase Auth, you can use this)
      // final AuthCredential credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth?.accessToken,
      //   idToken: googleAuth?.idToken,
      // );

      return googleUser;
    } catch (error) {
      // print("Error signing in: \$error");
      return null;
    }
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    // print("User signed out");
  }
}
