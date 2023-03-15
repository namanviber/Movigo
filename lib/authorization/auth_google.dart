import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth_Google {

  signInwithGoogle() async {
    final GoogleSignInAccount? _googleuser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await _googleuser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );


    return FirebaseAuth.instance.signInWithCredential(credential);
  }
}