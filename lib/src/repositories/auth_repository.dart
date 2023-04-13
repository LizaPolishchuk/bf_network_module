import 'package:bf_network_module/bf_network_module.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final LocalStorage _localStorage;

  AuthRepository(this._localStorage);

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await ConnectivityManager.checkInternetConnection();

    var response = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    _localStorage.setUserId(response.user!.uid);
  }

  Future<void> loginWithGoogle() async {
    await ConnectivityManager.checkInternetConnection();

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var response = await _firebaseAuth.signInWithCredential(credential);

    _localStorage.setUserId(response.user!.uid);
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await ConnectivityManager.checkInternetConnection();

    var response = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    print("firebase user isNewUser: ${response.additionalUserInfo?.isNewUser}");
    _localStorage.setUserId(response.user!.uid);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
