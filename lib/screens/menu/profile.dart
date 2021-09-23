import 'package:chatmate_login/models/disk_storage.dart';
import 'package:chatmate_login/screens/support/groups.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatmate_login/models/randomNameGenerator.dart';

import 'menu.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final DiskStorage _diskStorage = DiskStorage();

  String _username = '';
  String _email = '';

  getProfile() async {
    var profile = await _diskStorage.readFromDisk();
    _username = profile[0];
    _email = profile[1];
  }

  void initState(){
    getProfile();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        elevation: 0.0,
        // title: Image.asset("assets/images/chatmatelogo.png", width:140.0, height: 20.0),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            // On pressing the menu button => the menu screen is served
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );
          }, icon: Icon(Icons.more_vert, color: Color(0xFF000000), size: 24)),
        ],
      ),

      body: Container(
        color: Colors.white,

        padding: EdgeInsets.symmetric(horizontal: 8.0),

        child: Center(
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('$_username',
                      style: TextStyle(color: Color(0xFF009624), fontFamily: 'MonospaceBold', fontSize: 24.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12,),
                  Divider(height: 12,),
                  Image.asset("assets/images/profile.jpg", width: 180, height: 140),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('email:', style: TextStyle(color: Color(0xB3000000), fontSize: 12)),
                      SizedBox(width: 16,),
                      Text('example@gmail.com'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('phone:', style: TextStyle(color: Color(0xB3000000), fontSize: 12)),
                      SizedBox(width: 16,),
                      Text('255721600958'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Groups',
                      style: TextStyle(color: Color(0xB3009624), fontWeight: FontWeight.bold, letterSpacing: 1, wordSpacing: 2)),
                  SizedBox(height: 16,),
                  Text('1. Addiction Support Community'),
                  SizedBox(height: 8,),
                  Text('2. Depression Support Community'),

                  Divider(height: 48,),

                  Container(
                      padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 20, right: 20),

                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(24.0),
                        color: Color(0xFF00c853),
                      ),

                      child: TextButton(
                        onPressed: () async {
                          var username = generateRandomName();
                          _diskStorage.saveToDisk('$username', "mary@gmail.com");

                          var profile = await _diskStorage.readFromDisk();
                          var savedUsername = profile[0];
                          var savedEmail = profile[1];

                          setState(() {
                            _username = savedUsername;
                            // _email = savedEmail;
                          });
                        },
                        child: Text('generate new username',
                            style: TextStyle(color: Color(0xFFffffff), fontSize: 12.0, fontWeight: FontWeight.bold, letterSpacing: 1, wordSpacing: 2)),
                      )
                  ),


                ],
              )
            ),
          ),
        ),
      ),




    );
  }
}
