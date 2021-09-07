import 'package:chatmate_login/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Function => to create a Custom User Object based on the Firebase User object returned
  UserObj _userFromFirebaseUser(User user) {
    return UserObj(user.uid);
  }

  // Stream => to detect authentication changes.
  //           the stream will return User Object whenever there is a change on authentication
  Stream<User> get user {
    // var authStateChangesObj = _auth.authStateChanges();
    // return authStateChangesObj.map((User user) => _userFromFirebaseUser(user));
    return _auth.authStateChanges();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //1. Sign in Anonymously
    Future signInAnon() async{
      try{
        UserCredential result = await _auth.signInAnonymously();
        User user = result.user;
        return _userFromFirebaseUser(user);
      } catch(err){
          print(err.toString());
          return null;
      }
    }

  //2. Sign in with email $ password

  //3. Register with email $ password
  Future registerWithEmailAndPassword(String username, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: username, password: password);
      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch(err) {
        print(err.toString());
        return null;
    }
  }

  //4. Sign out
    Future signOut() async{
      try {
        return await _auth.signOut();
      } catch(err) {
          print(err.toString());
          return null;
      }
  }
}