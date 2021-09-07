import 'package:chatmate_login/screens/menu/menu.dart';
import 'package:chatmate_login/services/auth.dart';
import 'package:chatmate_login/theme/styles.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // HOME SCREEN
      // 1. appBar
      // 2. bottomAppBar

      backgroundColor: Colors.white,

      // App Bar
      //------------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: chatmateIconTheme(ThemeData.light().iconTheme),
        elevation: 2.0,

        toolbarHeight: 72.0,

        automaticallyImplyLeading: false,
        titleSpacing: 0,

        title: Container(
          padding: EdgeInsets.only(left: 20.0, right: 4.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset("assets/images/chatmatelogo.png", width:160.0, height: 28.0),
              IconButton(onPressed: (){
                // On pressing the menu button => the menu screen is served

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
                );
              }, icon: Icon(Icons.menu_rounded, size: 36)),
            ],
          ),
        ),
      ),
      //------------------------------------------------------------
      //Body
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text("Karibu.", style: TextStyle(fontFamily: 'MonospaceBold', fontSize: 24)),
                Text("We've Got You!", style: TextStyle(fontFamily: 'MonospaceBold', fontSize: 24)),
                Image.asset("assets/images/quickchat.png", height: 212),

                Text('Take a deep breathe. Relax. We are about to connect you to the best therapists and mental health services near you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16)
                ),

                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.only(top: 2.0, right: 16.0, bottom: 2.0, left: 16.0),
                    decoration: BoxDecoration(color: Color(0xFF00c853), borderRadius: BorderRadius.circular(24.0)),

                    child: TextButton(
                      child: Text('CONNECT',
                          style: TextStyle(color: Color(0xFFffffff), fontSize: 14.0, fontWeight: FontWeight.bold, letterSpacing: 3)),
                      onPressed: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Connect()),
                        // );
                      },
                    )
                ),

              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar
      //------------------------------------------------------------
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.only(left: 8.0, right: 0.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.home, size: 26.0)),
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined, size: 26.0)),
              IconButton(onPressed: (){}, icon: Icon(Icons.directions_sharp, size: 26.0)),
              IconButton(onPressed: (){}, icon: Icon(Icons.people_alt_outlined, size: 26.0)),
              IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble_outline, size: 26.0)),
            ],

          ),
        )
      ),

    );
  }
}
