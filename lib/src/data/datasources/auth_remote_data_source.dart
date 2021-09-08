import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';

abstract class AuthRemoteDataSource {
  Future<User?> loginWithGoogleWeb();

  Future<UserEntity> loginWithGoogle();

  Future<UserEntity> loginWithFacebook();

  Future<String> loginWithSocial(UserEntity user);

  Future<User?> signInWithEmailAndPassword(String email, String password);

  Future<User?> signUpWithEmailAndPassword(String email, String password);

  Future<UserEntity?> signUpWithEmailAndPasswordNew(
      String email, String password);

  Future<User?> signInWithFacebook();

  Future<User?> signInWithEmailAndLink(String email);

  Future<bool?> signInWithPhone(String phone);

  Future<String> verifyCode(String code);

  Future<void> sendLinkForEmailSignIn(String email);

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  late GoogleAuthProvider webGoogleSignIn;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookLogin;
  final LocalStorage localStorage;
  final APIClient apiClient;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.googleSignIn,
      this.facebookLogin, this.localStorage, this.apiClient);

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
  Future<UserEntity> loginWithGoogle() async {
    UserEntity userEntity;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw (Failure(
            message: "Error in sign in with google, googleUser is null"));
      }

      userEntity = new UserEntity(googleUser.id, googleUser.displayName,
          googleUser.email, googleUser.photoUrl, null);
    } catch (e) {
      print("Error in sign in with google: $e");
      throw (e);
    }

    return userEntity;
  }

  @override
  Future<UserEntity> loginWithFacebook() async {
    UserEntity userEntity;
    try {
      final LoginResult result = await facebookLogin.login();

      if (result.status == LoginStatus.success) {
        final fbUser = await facebookLogin.getUserData();

        userEntity = UserEntity(fbUser["id"], fbUser["name"], fbUser["email"],
            fbUser["picture"]["data"]["url"], null);
      } else {
        throw (Failure(
            message: "Error in sign in with facebook, facebookUser is null"));
      }
    } catch (e) {
      print("Error login with facebook: $e");
      throw (e);
    }

    return userEntity;
  }

  @override
  Future<String> loginWithSocial(UserEntity user) async {
    try {
      final authResult = await apiClient.loginWithSocial(user);

      if (authResult.user == null) {
        throw Failure(
            message: "Error login with social: ${authResult.message}");
      }

      print(
          "loginWithSocial success, token: ${authResult.accessToken}");

      localStorage.setAccessToken(authResult.accessToken);
      localStorage.setRefreshToken(authResult.refreshToken);
      localStorage.setCurrentUserId(user.id);
    } catch (e) {
      print("Error login with social: $e");
      throw (e);
    }

    return user.id;
  }

  @override
  Future<User?> loginWithGoogleWeb() async {
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
  Future<UserEntity?> signUpWithEmailAndPasswordNew(
      String email, String password) async {
    UserEntity? user;
    try {
      final authResult = await apiClient.signUpWeb(email, password);

      user = authResult.user;

      print(
          "signUpWithEmailAndPasswordNew accessToken token: ${authResult.accessToken}");

      // localStorage.setCurrentUserId(webFirebaseUser!.uid);
    } catch (e) {
      print("Error sign up with email and password: $e");
      throw (e);
    }

    return user;
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
    // apiClient.logout();
    localStorage.clear();
    return;
  }

  @override
  Future<bool?> signInWithPhone(String phone) async {
    return await apiClient.login(phone).then((value) {
      return true;
    }).catchError((e) {
      print("signInWithPhone error: $e");
      return false;
    });
  }

  @override
  Future<String> verifyCode(String code) async {
    UserEntity user;

    try {
      final authResult = await apiClient.verifyCode(code);

      if (authResult.user == null) {
        throw Failure(message: "${authResult.message}");
      }

      user = authResult.user!;

      print("verifyCode success, token: ${authResult.accessToken}");

      localStorage.setAccessToken(authResult.accessToken);
      localStorage.setRefreshToken(authResult.refreshToken);
      localStorage.setCurrentUserId(user.id);
    } catch (e) {
      if (e is DioError) {
        String? errorMessage = (e.response as Response).data["message"];
        if (errorMessage?.isNotEmpty == true) {
          print("Error verifyCode: $errorMessage");
        }
        throw (Failure(
            code: (e.response as Response).statusCode,
            message: "$errorMessage"));
      } else {
        print("Error verifyCode: $e");
        throw (e);
      }
    }

    return user.id;
  }
}
