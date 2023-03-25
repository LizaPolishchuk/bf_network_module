import 'package:bf_network_module/bf_network_module.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await ConnectivityManager.checkInternetConnection();

    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginWithGoogle() async {
    await ConnectivityManager.checkInternetConnection();

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await ConnectivityManager.checkInternetConnection();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
