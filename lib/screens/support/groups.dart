import 'package:chatmate_login/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:chatmate_login/theme/styles.dart';
import 'Addictonschat.dart';
import 'depressionchat.dart';
import 'package:chatmate_login/screens/maps/maps.dart';

//GROUPS
 class Groups extends StatelessWidget{

   Widget build(BuildContext context) {

     return Scaffold(

         backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: Colors.white,
           iconTheme:  IconThemeData(color: Color(0xFF000000)),
           elevation: 2.0,

           toolbarHeight: 72.0,

           titleSpacing: 0,

           title: Row(
             children: [
               Image.asset("assets/images/chatmatelogo.png", width:120.0, height: 20.0),
               SizedBox(width: 10,),
               Text('community',
                   style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 20.0,)
               )
             ],
           ),
         ),

         body: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,

               children: [
               Expanded(child:

                ListView(
                  children: [
                    Container(

                      margin: const EdgeInsets.only(bottom:10, top: 25),
                      height: 200,
                      padding:
                      const EdgeInsets.only(left:20,right:28, bottom:20),
                      child: Container(

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/depressed.png"), fit: BoxFit.cover
                          ),
                          color: Color(0xFF00c853),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(88.0),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                         left: 20,
                         top: 30.0,
                         bottom: 50,

                       ),
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[

                           Text(
                             "DEPRESSION SUPPORT COMMUNITY",

                           style: TextStyle(color: Color(0xFFffffff), fontSize: 13.0, fontWeight: FontWeight.bold, letterSpacing: 3)),


                           ButtonBar(
                             alignment: MainAxisAlignment.start,
                             children: [
                               FlatButton(
                                 child: Text('Join to chat with more friends about depression issues',
                                   style: TextStyle(color: Color(0xFF00c853)),),
                                 onPressed: (){
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => Depression()),
                                   );
                                 },
                               )
                             ]
                           )




                       ]
                     ),
                      ),

                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom:10, top: 10),
                        height: 200,
                        padding:
                        const EdgeInsets.only(left:20,right:28, bottom:20),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/addicted.png"), fit: BoxFit.cover
                              ),
                              color: Color(0xFF00c853),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(88.0),
                              )

                          ),
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 30.0,
                            bottom: 50,

                          ),

                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                              Text(
                              "ADDICTION SUPPORT COMMUNITY",
                              style: TextStyle(color: Color(0xFFffffff), fontSize: 13.0, fontWeight: FontWeight.bold, letterSpacing: 3)),
                                ButtonBar(
                                    alignment: MainAxisAlignment.start,
                                    children: [
                                      FlatButton(
                                        child: Text('Join to chat with more friends about addiction issues',
                                            style: TextStyle(color: Color(0xFF00c853)),
                                        ),
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Addictions()),
                                          );
                                        },)])],),),),],),),]),
       // Bottom Navigation Bar

         bottomNavigationBar: BottomAppBar(
            child: Container(
              padding: EdgeInsets.only(left: 8.0, right: 0.0),

            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);}, icon: Icon(Icons.home, size: 26.0)),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined, size: 26.0)),
                IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()));}, icon: Icon(Icons.directions_sharp, size: 26.0)),
                IconButton(onPressed: (){}, icon: Icon(Icons.people_alt_outlined, size: 26.0)),
                IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble_outline, size: 26.0)),],),)),

     );

   }

 }
