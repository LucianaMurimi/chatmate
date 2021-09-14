import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chatmate_login/theme/styles.dart';
import 'package:chatmate_login/screens/authenticate/sign_in.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){

        //----------------------------------------------------------------------
        if(snapshot.hasError){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: chatmateTheme(),
            home: Scaffold(body: Center(child: Text('${snapshot.error}'))),
          );
        }

        //----------------------------------------------------------------------
        if(snapshot.connectionState == ConnectionState.done){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: chatmateTheme(),
            home: SignIn(),
          );
        }

        //----------------------------------------------------------------------
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: chatmateTheme(),
          home: Scaffold(body: Center(child: SpinKitCircle(color: Color(0xFF00c853), size: 70.0))),
        );
      },
    );
  }
}


