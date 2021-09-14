import 'package:flutter/material.dart';
import 'package:chatmate_login/screens/menu/menu.dart';
import 'therapy.dart';

class TherapyServicesConnect extends StatefulWidget {
  const TherapyServicesConnect({Key? key}) : super(key: key);

  @override
  _TherapyServicesConnectState createState() => _TherapyServicesConnectState();
}

class _TherapyServicesConnectState extends State<TherapyServicesConnect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF000000)),
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 12.0, right: 12.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                //1. Therapy
                Text(
                    'Therapy',
                    style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 18.0),
                ),
                SizedBox(height: 16,),
                Text(
                  'Take the first step. Get in touch with the best therapists and begin your healing journey now.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100)),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.only(top: 1.0, right: 16.0, bottom: 1.0, left: 16.0),
                    decoration: BoxDecoration(border: Border.all(color: Color(0xFF00c853), width: 2.0), borderRadius: BorderRadius.circular(24.0),),

                    child: TextButton(
                      child: Text('CONNECT NOW',
                          style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 16.0, letterSpacing: 2)),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Therapy()),
                        );
                      },
                    )
                ),


                SizedBox(height: 24.0,),
                Divider(height: 4.0,),
                SizedBox(height: 24.0,),

                //----------------------------------------------------------------
                //2. Services Near Me
                Text(
                    'Services Near Me',
                    style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 18.0),
                ),
                SizedBox(height: 16,),
                Text('Get a roadmap and directions to the best mental health services near you.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.only(top: 1.0, right: 16.0, bottom: 1.0, left: 16.0),
                    decoration: BoxDecoration(border: Border.all(color: Color(0xFF00c853), width: 2.0), borderRadius: BorderRadius.circular(24.0)),


                    child: TextButton(
                      child: Text('GET SERVICE',
                          style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 16.0, letterSpacing: 2)),
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
