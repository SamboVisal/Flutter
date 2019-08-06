import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name;
String email;
String imageUrl;

Future<String> signInwithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  assert(authResult.user.email != null);
  assert(authResult.user.photoUrl != null);
  assert(authResult.user.displayName != null);

  name = authResult.user.displayName;
  email = authResult.user.email;
  imageUrl = authResult.user.photoUrl;
  if(name.contains(" ")){
    name = name.substring(0,name.indexOf(" "));
  }

  assert(!authResult.user.isAnonymous);
  assert(await authResult.user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  
  assert(authResult.user.uid == currentUser.uid);
  
  return "Sign In with google succeeded: $authResult.user";
}

void signOutGoogle() async {
  googleSignIn.signOut();

  print("User sign out from google");
}