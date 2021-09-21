import 'package:flutter/material.dart';
import 'package:chatmate_login/services/auth.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'sign_in.dart';

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
  String confirmPassword = '';
  bool obscurePassword = true;
  bool _loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Register SCREEN
      //    1. logo
      //    2. username TextFormField
      //    3. password TextFormField
      //    4. Register Button

      body: LoadingOverlay(
        child: Center(
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
                        validator: (val) => val!.isEmpty ? 'enter an email address' : null,
                        onChanged: (val) {
                          setState(() => username = val);
                        },

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'example@gmail.com', labelStyle: TextStyle(fontSize: 10.0),
                          icon: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.email, size: 16, color: Color(0xB3000000)),
                          ),
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
                          icon: IconButton(
                            onPressed: (){setState(() {
                              obscurePassword = !obscurePassword;
                            });},
                            icon: obscurePassword ? Icon(Icons.visibility_off, size: 16, color: Color(0xB3000000),)
                                : Icon(Icons.visibility, size: 16, color: Color(0xB3000000)),
                          ),
                        ),
                      ),

                    ),

                    SizedBox(height: 20.0,),

                    // 4. Confirm Password TextFormField
                    //------------------------------------------------------------
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),

                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(24.0),
                        border: Border.all(color: Color(0xFFd3d3d3), width: 1,),
                      ),

                      child: TextFormField(
                        obscureText: obscurePassword ? true : false,
                        validator: (val) => val! != password ? 'password mismatch' : null,
                        onChanged: (val) {
                          setState(() => confirmPassword = val);
                        },

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'confirm password', labelStyle: TextStyle(fontSize: 10.0),
                          icon: IconButton(
                            onPressed: (){setState(() {
                              obscurePassword = !obscurePassword;
                            });},
                            icon: obscurePassword ? Icon(Icons.visibility_off, size: 16, color: Color(0xB3000000),)
                                : Icon(Icons.visibility, size: 16, color: Color(0xB3000000)),
                          ),
                        ),
                      ),

                    ),

                    SizedBox(height: 28.0),

                    // 5. login Button
                    //------------------------------------------------------------
                    Container(
                      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                      width: double.infinity,

                      decoration: BoxDecoration(color: Color(0xFF00c853),),

                      child: TextButton(
                        child: Text('Register',
                            style: TextStyle(color: Color(0xFFffffff), fontSize: 16.0, fontWeight: FontWeight.bold, letterSpacing: 2, wordSpacing: 3.6)),

                        onPressed: () async {
                          //----------------------------------------------------
                          if(_formKey.currentState!.validate()){
                            try{
                              setState(() {
                                _loading = true;
                              });

                              dynamic result = await _auth.registerWithEmailAndPassword(username, password);

                              if(result != null){
                                // registration successful
                                setState(() {
                                  _loading = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Registration successful!',
                                        style: TextStyle(color: Colors.green),
                                        textAlign: TextAlign.center,),
                                        backgroundColor: Color(0xFFffffff),)
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignIn()),
                                  );
                                });

                              } else {
                                // registration unsuccessful
                                setState(() {
                                  _loading = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Could not register the user with the given credentials!',
                                        style: TextStyle(color: Colors.red),
                                        textAlign: TextAlign.center,),
                                        backgroundColor: Color(0xFFffffff),)
                                  );
                                });
                              }
                              //----------------------------------------------------
                            } catch(err){
                              print(err);
                            }
                          }

                        },
                      ),

                    ),

                    SizedBox(height: 20.0),

                    // 6. login | exit
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          InkWell(
                            child: Text('Login'),

                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignIn()),
                              );
                            },
                          ),
                          Text('    |    '),
                          InkWell(
                            child: Text('Exit'),

                            onTap: (){

                            },
                          )
                        ],
                      )
                    )





                  ],
                ),
              ),

            ),
          ),
        ),
        isLoading: _loading,
        opacity: 0.7,
        progressIndicator: SpinKitCircle(color: Color(0xFF00c853), size: 70.0),
        color: Color(0xFFc0c0c0),
      ),

    );
  }
}
