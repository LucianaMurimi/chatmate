import 'package:flutter/material.dart';
import 'package:chatmate_login/theme/styles.dart';



class Addictions extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: chatmateIconTheme(ThemeData
              .light()
              .iconTheme),
          elevation: 2.0,

          toolbarHeight: 72.0,

          titleSpacing: 0,

          title: Text('Share your Story',
              style: TextStyle(color: Color(0xFF000000),
                  fontFamily: 'MonospaceBold',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ),
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
    ));



  }
}