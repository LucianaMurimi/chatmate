import 'package:chatmate_login/screens/authenticate/register.dart';
import 'package:chatmate_login/screens/home/home.dart';
import 'package:chatmate_login/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  // Define two states: username and password
  // These states keep track of the values being entered in the sign in form

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // SIGN IN SCREEN
      //    1. logo
      //    2. username TextFormField
      //    3. password TextFormField
      //    4. login Button
      //    5. password | register links

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),

            child: Form(
              child: Column(
                children: [
                  // 1. logo
                  //------------------------------------------------------------
                  new Image.asset("assets/images/logo.png", width: 160, height: 120),
                  SizedBox(height: 28.0),

                  // 2. username TextFormField
                  //------------------------------------------------------------
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),

                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(24.0),
                      border: Border.all(color: Color(0xFFd3d3d3), width: 1,),
                    ),

                    child: TextFormField(
                      onChanged: (val) {
                        setState(() => username = val);
                        },

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'username', labelStyle: TextStyle(fontSize: 10.0),
                      ),
                    ),

                  ),

                  SizedBox(height: 20.0),

                  // 3. password TextFormField
                  //------------------------------------------------------------
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),

                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(24.0),
                      border: Border.all(color: Color(0xFFd3d3d3), width: 1,),
                    ),

                    child: TextFormField(
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                        },

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'password', labelStyle: TextStyle(fontSize: 10.0),
                      ),
                    ),

                  ),

                  SizedBox(height: 28.0),

                  // 4. login Button
                  //------------------------------------------------------------
                  Container(
                      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: Color(0xFF00c853),
                        // borderRadius: new BorderRadius.circular(24.0),

                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Color(0xBF000000),
                        //     offset: const Offset(2.0, 2.0),
                        //     blurRadius: 5.0,
                        //   ),
                        // ]
                      ),


                    child: TextButton(
                        onPressed: (){
                          print(username);
                          print(password);
                          // On pressing the login button => the home screen is served

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Text('log in',
                            style: TextStyle(color: Color(0xFFffffff), fontSize: 16.0, fontWeight: FontWeight.bold, letterSpacing: 2, wordSpacing: 3.6)),
                        )
                    ),

                  SizedBox(height: 20.0),

                  // 5. password | register links
                  //------------------------------------------------------------
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('Password'),
                        Text('    |    '),
                        InkWell(
                          child: Text('Register'),

                          onTap: (){
                            // On pressing the Register => the register screen is served

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                            );
                          },
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),

          ),
        ),
      ),

    );

  }
}
