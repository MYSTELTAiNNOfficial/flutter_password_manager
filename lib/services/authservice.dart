part of 'services.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  //Sign in with google account
  static Future<UserCredential> signInWithGoogle() async {
    Firebase.initializeApp();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await auth.signInWithCredential(credential);
  }

  //Sign out from application
  static Future signOut() async {
    Firebase.initializeApp();
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    return true;
  }
}
