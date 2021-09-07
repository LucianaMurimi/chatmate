import 'package:chatmate_login/models/user.dart';
import 'package:chatmate_login/screens/authenticate/authenticate.dart';
import 'package:chatmate_login/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate widget

    final user =  Provider.of<User?>(context);   // everytime the user logs in/out,
                                                 // a user object is returned from the stream and stored in the `user` variable.
    print(user);
    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }

  }
}
