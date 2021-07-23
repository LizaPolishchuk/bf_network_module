import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signInWithGoogle();

  Future<User?> signInWithEmailAndPassword(String email, String password);

  Future<User?> signUpWithEmailAndPassword(String email, String password);

  Future<User?> signInWithFacebook();

  Future<User?> signInWithEmailAndLink(String email);

  Future<void> sendLinkForEmailSignIn(String email);

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  late GoogleAuthProvider webGoogleSignIn;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookLogin;
  final LocalStorage localStorage;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.googleSignIn,
      this.facebookLogin, this.localStorage);

  @override
  Future<User?> signInWithFacebook() async {
    final LoginResult result = await facebookLogin.login();

    if (result.status == LoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      final User? user =
          (await firebaseAuth.signInWithCredential(credential)).user;

      if (user?.isAnonymous == true) {
        return null;
      } else if (user != null) {
        localStorage.setCurrentUserId(user.uid);
        return user;
      }
    } else {
      return null;
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    User? firebaseUser;
    try {
      //For web
      if (kIsWeb) {
        UserCredential _userCredential =
            await firebaseAuth.signInWithPopup(new GoogleAuthProvider());
        firebaseUser = _userCredential.user;
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        if (googleAuth == null) {
          throw (Exception("googleAuth is null"));
        }

        final userCred = await FirebaseAuth.instance
            .signInWithCredential(GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        ));

        firebaseUser = userCred.user;
      }

      localStorage.setCurrentUserId(firebaseUser!.uid);
    } catch (e) {
      firebaseUser = null;
      print("Error in sign in with google: $e");
      throw (e);
    }

    return firebaseUser;
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    User? webFirebaseUser;
    try {
      final authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      webFirebaseUser = authResult.user;
      localStorage.setCurrentUserId(webFirebaseUser!.uid);
    } catch (e) {
      webFirebaseUser = null;
      print("Error in sign in with email and password: $e");
      throw (e);
    }

    return webFirebaseUser;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    User? webFirebaseUser;
    try {
      final authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      webFirebaseUser = authResult.user;
      localStorage.setCurrentUserId(webFirebaseUser!.uid);
    } catch (e) {
      webFirebaseUser = null;
      print("Error sign up with email and password: $e");
      throw (e);
    }

    return webFirebaseUser;
  }

  @override
  Future<User?> signInWithEmailAndLink(String email) async {
    return null;
    // firebaseAuth.signInWithEmailLink(email: email, emailLink: emailLink)
  }

  @override
  Future<void> sendLinkForEmailSignIn(String email) async {
    firebaseAuth
        .sendSignInLinkToEmail(
            email: email,
            actionCodeSettings: ActionCodeSettings(
                dynamicLinkDomain: 'salonsapp.page.link',
                url: "https://salonsapp.page.link/welcome",
                // url: 'https://www.salonsapp.com/?email=' + email,
                handleCodeInApp: true,
                androidInstallApp: true,
                androidMinimumVersion: "1",
                iOSBundleId: "pea.salonsapp.web",
                androidPackageName: 'pea.salonsapp.web'))
        .then((value) => print("sendSignInLinkToEmail success"))
        .catchError((error) => print("sendSignInLinkToEmail Error: $error"));
  }

  @override
  Future<void> signOut() async {
    facebookLogin.logOut();
    googleSignIn.signOut();
    firebaseAuth.signOut();
    localStorage.clear();
    return;
  }
}
