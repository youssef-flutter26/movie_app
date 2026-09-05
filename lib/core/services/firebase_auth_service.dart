import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();

      return FirebaseAuth.instance.currentUser!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email.',
        );
      } else {
        throw CustomException(
          message: 'An error occurred. Please try again later.',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'An error occurred. Please try again later.',
      );
    }
  }

  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        throw CustomException(message: 'the password is incorrect');
      } else if (e.code == 'user not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else {
        throw CustomException(
          message: 'An error occurred. Please try again later.',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'An error occurred. Please try again later.',
      );
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      // 1. شيل initialize خالص
      await GoogleSignIn.instance.signOut();

      // 2. سجل دخول على طول
      final googleUser = await GoogleSignIn.instance.authenticate();

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      return userCredential.user!;
    } catch (e) {
      throw CustomException(message: 'Google Sign In Failed: ${e.toString()}');
    }
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  bool isUserLoggedIn() {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
