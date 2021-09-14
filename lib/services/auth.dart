import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Function => to create a Custom User Object based on the Firebase User object returned

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //1. Sign in Anonymously
    Future signInAnon() async{
      try{
        UserCredential result = await _auth.signInAnonymously();
        return result;

      } catch(err){
          print(err.toString());
          return null;
      }
    }


  //2. Register with email $ password
  Future registerWithEmailAndPassword(String username, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: username, password: password);
      return result;

    } catch(err) {
      print(err.toString());
      return null;
    }
  }

  //3. Sign in with email $ password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result;

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