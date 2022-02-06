import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GoogleSigninProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get currentUser => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future Logout() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    _user = null;
    notifyListeners();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingAnimationWidget.inkDrop(
        color: Colors.white,
        size: 75,
      ),
    );
  }
}
