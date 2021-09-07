import 'package:chatmate_login/models/user.dart';
import 'package:chatmate_login/screens/authenticate/authenticate.dart';
import 'package:chatmate_login/screens/wrapper.dart';
import 'package:chatmate_login/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:chatmate_login/theme/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //Firebase.initializeApp() has to be called before using any Firebase product.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Wrapping everything within the provider.
    return StreamProvider<User?>.value(
      initialData: null,
      value: AuthService().user,  //specifying what stream we are going to listen to
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: chatmateTheme(),
        home: Wrapper(),
      ),
    );

  }
}


