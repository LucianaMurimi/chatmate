import 'package:chatmate_login/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:chatmate_login/theme/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Depression extends StatefulWidget {

  @override
  _DepressionState createState() => _DepressionState();
}

class _DepressionState extends State<Depression> {
  bool sentByMe = false;
  var messsengerName;
  var message;

  //----------------------------------------------------------------------------
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference depressionSupportGroup = FirebaseFirestore.instance.collection('depressionSupportGroup');

  final Stream<QuerySnapshot> _depressionSupportGroupStream = FirebaseFirestore.instance.collection('depressionSupportGroup').snapshots();
  //----------------------------------------------------------------------------

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme:  IconThemeData(color: Color(0xFF000000)),
          elevation: 2.0,

          toolbarHeight: 72.0,

          titleSpacing: 0,

          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/cmlogo.png", width: 28, height: 26.0),

                Container(
                  child: Row(
                    children: [
                      Text('DEPRESSION SUPPORT',
                          style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 16.0,)
                      ),
                      IconButton(onPressed: (){
                        // On pressing the menu button => the menu screen is served
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Menu()),
                        );
                      }, icon: Icon(Icons.more_vert, color: Color(0xFF000000), size: 24)),
                    ],
                  ),

                )
              ],
            ),
          ),
        ),
        //------------------------------------------------------------------------

        body: LayoutBuilder(builder: (context, constraints){
          return ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Container(
                color: Color(0x0D00c853),
                padding: EdgeInsets.only(top: 16),

                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Expanded(
                          child: StreamBuilder(
                            stream: _depressionSupportGroupStream,
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                              List<Widget> response = [];

                              if (snapshot.hasError) {
                                return Center(child: Text('Something went wrong'));
                              }

                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: SpinKitCircle(color: Color(0xFF00c853), size: 70.0),);
                              }

                              return ListView(
                                children: snapshot.data!.docs.map((DocumentSnapshot document) {

                                  document.data().forEach((key, value) {
                                    messsengerName = value['messenger_name'];
                                    message = value['message'];

                                    response.add(
                                        Container(
                                          padding: EdgeInsets.only(
                                            top: 4,
                                            bottom: 4,
                                            left: sentByMe ? 0 : 24,
                                            right: sentByMe ? 24 : 0,
                                          ),
                                          alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,

                                          child: Container(
                                            margin: sentByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
                                            padding: EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),

                                            decoration: BoxDecoration(
                                              borderRadius: sentByMe ? BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight: Radius.circular(32),
                                                  bottomLeft: Radius.circular(24)
                                              ) : BorderRadius.only(
                                                  topLeft: Radius.circular(32),
                                                  topRight: Radius.circular(24),
                                                  bottomRight: Radius.circular(24)
                                              ),
                                              border: Border.all(color : sentByMe ? Color(0x80006700) : Color(0x80000000), width: 2.0),
                                              color: Colors.white,

                                            ),

                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text('$messsengerName'.toUpperCase(), textAlign: TextAlign.start, style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xB3000000), letterSpacing: 1)),
                                                SizedBox(height: 7.0),
                                                Text('$message', textAlign: TextAlign.start, style: TextStyle(fontSize: 14.0, color: Color(0xFF000000))),
                                              ],
                                            ),

                                          ),
                                        )
                                    );

                                  });
                                  return Column(children: response.reversed.toList(),);
                                }).toList(),
                              );
                            },
                          )
                      ),
                    ),
                    //------------------------------------------------------------------
                    // 2. Message Input TextField
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF9b9b9b).withOpacity(0.5),
                            spreadRadius: 8,
                            blurRadius: 4,
                            offset: Offset(0, 7), // changes position of shadow
                          ),
                        ],
                      ),

                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                        color: Colors.white,

                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "message ...",
                                    border: InputBorder.none,
                                  ),
                                )
                            ),

                            SizedBox(width: 12.0,),

                            GestureDetector(
                              onTap: (){
                                //_sendMessage
                              },
                              child: Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF00c853),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(child: Icon(Icons.send, color: Colors.white,),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );}
        )
    );



  }
}