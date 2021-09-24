import 'package:chatmate_login/models/disk_storage.dart';
import 'package:chatmate_login/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:chatmate_login/theme/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../globals.dart';


class Addictions extends StatefulWidget {

  @override
  _AddictionsState createState() => _AddictionsState();
}

class _AddictionsState extends State<Addictions> {
  var messengerName;
  var message;
  var timestamp;

  var profile;
  var savedUsername;


  final _messageController = TextEditingController();

  final DiskStorage _diskStorage = DiskStorage();

  //----------------------------------------------------------------------------
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference addictionSupportGroup = FirebaseFirestore.instance.collection('addictionSupportGroup');

  final Stream<QuerySnapshot> _addictionSupportGroupStream = FirebaseFirestore.instance.collection('addictionSupportGroup')
      .orderBy('timestamp', descending: false).snapshots();
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

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('ADDICTION SUPPORT',
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
                        stream: _addictionSupportGroupStream,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                          if (snapshot.hasError) {
                            return Center(child: Text('Something went wrong'));
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: SpinKitCircle(color: Color(0xFF00c853), size: 70.0),);
                          }
                          // var savedUsername = getSavedProfile;
                          return ListView(
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                              messengerName = data['messenger_name'];
                              message = data['message'];
                              timestamp = data['timestamp'];

                              var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp  * 1000, isUtc: false);

                              return Container(
                                padding: EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                  left: (messengerName == usernameMain) ? 0 : 24,
                                  right: (messengerName == usernameMain) ? 24 : 0,
                                ),
                                alignment: (messengerName == usernameMain) ? Alignment.centerRight : Alignment.centerLeft,

                                child: Container(
                                  margin: (messengerName == usernameMain) ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
                                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),

                                  decoration: BoxDecoration(
                                    borderRadius: (messengerName == usernameMain) ? BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(32),
                                        bottomLeft: Radius.circular(24)
                                    ) : BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(24),
                                        bottomRight: Radius.circular(24)
                                    ),
                                    border: Border.all(color : (messengerName == usernameMain) ? Color(0x80006700) : Color(0x80000000), width: 2.0),
                                    color: Colors.white,

                                  ),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text('$messengerName'.toUpperCase(), textAlign: TextAlign.start, style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xB3000000), letterSpacing: 1)),
                                      SizedBox(height: 8.0),
                                      Text('$message', textAlign: TextAlign.start, style: TextStyle(fontSize: 14.0, color: Color(0xFF000000))),
                                      SizedBox(height: 12.0,),
                                      Text('${date.toLocal().hour}:${date.toLocal().minute},  ${date.toLocal().day}/${date.toLocal().month}/${date.toLocal().year}',
                                          textAlign: TextAlign.start, style: TextStyle(fontSize: 8, color: Color(0xB3000000), letterSpacing: 1)),
                                    ],
                                  ),

                                ),
                              );
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
                                controller: _messageController,
                                decoration: InputDecoration(
                                  hintText: "message ...",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                                ),
                              )
                          ),

                          SizedBox(width: 12.0,),

                          GestureDetector(
                            onTap: () async {
                              profile = await _diskStorage.readFromDisk();
                              savedUsername = profile[0];

                              //_sendMessage
                              message = _messageController.text;
                              if(message == ''){return;}
                              else{
                                print(savedUsername);
                                addictionSupportGroup.add({
                                  'message' : message,
                                  'messenger_name': savedUsername,
                                  'timestamp': DateTime.now().millisecondsSinceEpoch,
                                }).then((value){
                                  print("User Added");
                                  FocusScopeNode currentFocus = FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                    _messageController.text = '';
                                  }
                                }).catchError((error){
                                  print("Failed to add user: $error");
                                });

                              }
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