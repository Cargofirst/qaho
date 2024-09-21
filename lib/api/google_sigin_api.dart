import 'package:google_sign_in/google_sign_in.dart';

class GoogleSiginApi {
  // GoogleSignIn instance
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'displayName',
      'profile',
      'https://www.googleapis.com/auth/contacts.readonly',
      'https://www.googleapis.com/auth/contacts.other.readonly',
      'serverAuthCode',
      'photoUrl',
      'id'
    ],
  );

  // Sign in with Google
  static Future<GoogleSignInAccount?> signIn() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      return null;
    }
  }

  // Sign out with Google
  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      return;
    }
  }
}
