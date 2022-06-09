import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/common/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/salon_response.dart';

abstract class AuthRemoteDataSource {
  // Future<User?> loginWithGoogleWeb();

  Future<UserEntity> loginWithGoogle();

  Future<UserEntity> loginWithFacebook();

  Future<Map<UserEntity, bool?>> loginWithSocial(UserEntity user);

  Future<Salon> signInWithEmailAndPassword(String email, String password);

  Future<Salon> signUpWithEmailAndPassword(
      String email, String password);

  // Future<User?> signInWithFacebook();

  // Future<User?> signInWithEmailAndLink(String email);

  Future<void> signInWithPhone(String phone);

  Future<Map<UserEntity, bool?>> verifyCode(String code, String phoneNumber);

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookLogin;
  final LocalStorage localStorage;
  final APIClient apiClient;

  AuthRemoteDataSourceImpl(this.googleSignIn, this.firebaseAuth,
      this.facebookLogin, this.localStorage, this.apiClient);

  @override
  Future<UserEntity> loginWithGoogle() async {
    UserEntity userEntity;
    try {
      // await ConnectivityManager.checkInternetConnection();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw (Failure(
            message: "Error in sign in with google, googleUser is null"));
      }

      userEntity = new UserEntity(googleUser.id, googleUser.displayName,
          googleUser.email, googleUser.photoUrl, null, null);
    } catch (e) {
      if (e is FirebaseAuthException) {
       print("${e.code}");
      }
      //sign_in_canceled
      print("Error in sign in with google: $e");
      throw (e);
    }

    return userEntity;
  }

  @override
  Future<UserEntity> loginWithFacebook() async {
    UserEntity userEntity;
    try {
      // await ConnectivityManager.checkInternetConnection();

      final LoginResult result = await facebookLogin.login();

      if (result.status == LoginStatus.success) {
        final fbUser = await facebookLogin.getUserData();

        userEntity = UserEntity(fbUser["id"], fbUser["name"], fbUser["email"],
            fbUser["picture"]["data"]["url"], null, null);
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
  Future<Map<UserEntity, bool?>> loginWithSocial(UserEntity user) async {
    bool? creator;
    UserEntity userFromResp;
    try {
      // await ConnectivityManager.checkInternetConnection();

      final authResult = await apiClient.loginWithSocial(user);

      if (authResult.user == null) {
        throw Failure(
            message: "Error login with social: ${authResult.message}");
      }

      creator = authResult.creator;
      userFromResp = authResult.user!..isRegistered = !creator!;

      print("loginWithSocial success, token: ${authResult.accessToken}");

      localStorage.setAccessToken(authResult.accessToken);
      localStorage.setRefreshToken(authResult.refreshToken);
      localStorage.setCurrentUserId(userFromResp.id);
      localStorage.setCurrentUser(userFromResp);
    } catch (e) {
      print("Error login with social: $e");
      throw (e);
    }

    return {userFromResp: creator};
  }

  @override
  Future<Salon> signInWithEmailAndPassword(
      String email, String password) async {
    SalonResponse salonData;
    try {
      // await ConnectivityManager.checkInternetConnection();

      final authResult = await apiClient.loginWeb(email, password);

      if (authResult.salonData == null) {
        throw Failure(message: "${authResult.message ?? "signInWithEmailAndPassword Salon is null"}");
      }

      salonData = authResult.salonData!;

      print("signUpWithEmailAndPasswordNew accessToken token: ${authResult.accessToken}");

      localStorage.setSalon(salonData.salon!);
      localStorage.setSalonId(salonData.salon!.id);
      localStorage.setMastersList(salonData.masters ?? []);
      localStorage.setServicesList(salonData.services ?? []);
      localStorage.setAccessToken(authResult.accessToken);
      localStorage.setRefreshToken(authResult.refreshToken);
    } catch (e) {
      print("Error sign up with email and password: $e");

      if (e is DioError) {
        String? errorMessage = (e.response as Response).data["message"];

        if (errorMessage?.isNotEmpty != true) {
          errorMessage = "Something went wrong";
        }

        throw(Failure(message: errorMessage!));
      }

      throw (e);
    }

    return salonData.salon!;
  }

  @override
  Future<Salon> signUpWithEmailAndPassword(
      String email, String password) async {
    SalonResponse salonData;
    try {
      // await ConnectivityManager.checkInternetConnection();

      final authResult = await apiClient.signUpWeb(email, password);

      if (authResult.salonData?.salon == null) {
        throw Failure(message: "${authResult.message ?? "signUpWithEmailAndPassword Salon is null"}");
      }

      salonData = authResult.salonData!;

      print("signUpWithEmailAndPasswordNew accessToken token: ${authResult.accessToken}");

      localStorage.setSalon(salonData.salon!);
      localStorage.setSalonId(salonData.salon!.id);
      localStorage.setMastersList(salonData.masters ?? []);
      localStorage.setServicesList(salonData.services ?? []);
      localStorage.setAccessToken(authResult.accessToken);
      localStorage.setRefreshToken(authResult.refreshToken);
    } catch (e) {
      print("Error sign up with email and password: $e");

      if (e is DioError) {
        String? errorMessage = (e.response as Response).data["message"];

        if (errorMessage?.isNotEmpty != true) {
          errorMessage = "Something went wrong";
        }

        throw(Failure(message: errorMessage!));
      }
      throw (e);
    }

    return salonData.salon!;
  }

  @override
  Future<void> signOut() async {
    facebookLogin.logOut();
    googleSignIn.signOut();
    // apiClient.logout();
    localStorage.clear();
    return;
  }

  String? verificationId;
  @override
  Future<void> signInWithPhone(String phone) async {
    final completer = Completer<void>();

    try {
      // await ConnectivityManager.checkInternetConnection();

      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          completer.completeError(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          completer.complete();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      rethrow;
    }

    return completer.future;
  }

  @override
  Future<Map<UserEntity, bool?>> verifyCode(String code, String phoneNumber) async {
    UserCredential loggedInUser;
    bool isNewUser = true;

    try {
      // await ConnectivityManager.checkInternetConnection();

      assert(verificationId != null);

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: code);

      loggedInUser = await firebaseAuth.signInWithCredential(credential);
      isNewUser = loggedInUser.additionalUserInfo?.isNewUser ?? true;

      assert(loggedInUser.user?.uid != null);

      debugPrint("User success logged in uid: ${loggedInUser.user!.uid}");

      UserEntity userEntity = UserEntity(loggedInUser.user!.uid, "", "", "", phoneNumber, null);

      var response = await loginWithSocial(userEntity);

      return response;
    } catch (e) {
      print("Error verifyCode: $e");

      if (e is FirebaseAuthException) {
        String? errorMessage = e.message;
        throw (Failure(
            codeStr: e.code,
            message: "$errorMessage"));
      } else {
        throw (e);
      }
    }
  }
}
