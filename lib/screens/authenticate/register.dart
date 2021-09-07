import 'package:flutter/material.dart';
import 'package:chatmate_login/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Define two states: username and password
  // These states keep track of the values being entered in the sign in form

  String username = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Register SCREEN
      //    1. logo
      //    2. username TextFormField
      //    3. password TextFormField
      //    4. Register Button

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),

            child: Form(
              // Associating the global `_formKey` with the form;
              // this key will keep track of the state of our form.
              key: _formKey,

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
                      validator: (val) => val!.isEmpty ? 'enter a username' : null,
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
                      validator: (val) => val!.length < 3 ? 'must have at least 6 characters' : null,
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
                        child: Text('Register',
                            style: TextStyle(color: Color(0xFFffffff), fontSize: 16.0, fontWeight: FontWeight.bold, letterSpacing: 2, wordSpacing: 3.6)),

                        onPressed: () async {
                          // On pressing `Register` Button
                          // i. validate the form using the `_formKey`
                          if(_formKey.currentState!.validate()){
                            dynamic result = await _auth.registerWithEmailAndPassword(username, password);

                            // result == null ;if there was some error
                            // result == user ;if successful

                          }

                        },
                      ),


                  ),

                ],
              ),
            ),

          ),
        ),
      ),

    );
  }
}
