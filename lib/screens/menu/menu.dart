import 'package:chatmate_login/screens/authenticate/sign_in.dart';
import 'package:chatmate_login/services/auth.dart';
import 'package:chatmate_login/theme/styles.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Menu SCREEN
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

        titleSpacing: 0,

        title: Text('Menu',
            style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 24.0, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person, size: 26.0),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.help_outline_rounded, size: 26.0),
            title: Text('Help'),
          ),
          ListTile(
            leading: Icon(Icons.report_problem_outlined, size: 26.0),
            title: Text('Report a Problem'),
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded, size: 26.0),
            title: Text('Log Out'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Log Out?'),
                      content: Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(onPressed: () async {
                          await _auth.signOut()
                          .then((value) => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignIn()),
                              )
                            });
                        },
                            child: Text('Yes', style: TextStyle(color: Color(0xFF000000)),)),
                        TextButton(onPressed: (){}, child: Text('No'))
                      ],
                    );
                  }
              );
            },
          ),

        ],
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
