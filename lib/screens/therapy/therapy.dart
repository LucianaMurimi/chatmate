import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatmate_login/screens/menu/menu.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math' as math;
import '../../services/daraja.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'search_results.dart';
import 'package:chatmate_login/globals.dart';

class Therapy extends StatefulWidget {
  const Therapy({Key? key}) : super(key: key);

  @override
  _TherapyState createState() => _TherapyState();
}

class _TherapyState extends State<Therapy> {
  String email = '';
  int phone = 0;
  bool consentCheck = false;
  bool _search = false;

  final searchItemController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference therapists = FirebaseFirestore.instance.collection('therapists');

  final Stream<QuerySnapshot> _therapistsStream = FirebaseFirestore.instance.collection('therapists').snapshots();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF000000)),
          elevation: 2.0,

          toolbarHeight: 112.0,

          titleSpacing: 0,

          automaticallyImplyLeading: _search ? false : true,

          title: Container(
            padding: EdgeInsets.only(right: 4.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: _search ? [
              IconButton(
                icon: Icon(Icons.close, color: Color(0xFF000000), size: 20),
                onPressed: (){
                  setState(() {
                    _search = !_search;
                  });
                },
              ),
              Container(
                height: 20,
                width: 220,

                child: TextField(
                  controller: searchItemController,
                  decoration: InputDecoration(
                    hintText: 'search therapists by region...',
                    hintStyle: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),

              Transform.rotate(
                angle: 90 * math.pi / 180,
                child: IconButton(
                  icon: Icon(Icons.search_rounded, color: Color(0xFF000000), size: 20),
                  onPressed: (){
                    var searchItem = searchItemController.text;

                    setState(() {
                      _search = !_search;

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchResults(searchItem)),
                      );
                    });
                  },
                ),
              ),
              ]
              //----------------------------------------------------------------
                  :
              [
                Image.asset("assets/images/chatmatelogo.png", width:120.0, height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: 45 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(Icons.push_pin_rounded, color: Color(0xFF000000), size: 20),
                        onPressed: null,
                      ),
                    ),

                    Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(Icons.search_rounded, color: Color(0xFF000000), size: 20),
                        onPressed: (){
                          setState(() {
                            _search = !_search;
                          });
                        },
                      ),
                    ),

                    IconButton(onPressed: (){
                      // On pressing the menu button => the menu screen is served
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Menu()),
                      );
                    }, icon: Icon(Icons.more_vert, color: Color(0xFF000000), size: 28)),

                  ],
                ),
              ]
            //----------------------------------------------------------------

          ),
          ),

          bottom: TabBar(
            indicatorWeight: 2,
            indicatorColor: Color(0xFF00c853),

            tabs: [
              Tab(child: Text('Contact',
                style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 14.0),
              ),),
              Tab(child: Text('Connect',
                style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 14.0),
              ),),
              Tab(child: Text('Payment',
                style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 14.0),
              ),),
            ],
          ),

        ),
        //------------------------------------------------------------------------
        body: LoadingOverlay(
          child: TabBarView(
            children: [
              //------------------------------------------------------------------
              // 1. Contact Information
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SizedBox(height: 24,),
                      Text('Contact Information',
                        style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 18.0),
                      ),
                      SizedBox(height: 16,),
                      Text('Contact information is used to comply with therapy regulations. '
                          'This information will not be shared to anyone unless we absolutely believe you are at immediate risk.',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12,),
                      Form(
                          child: Column(

                            children: [
                              TextFormFieldWidget(label: 'example@gmail.com', value: email),
                              SizedBox(height: 8.0,),
                              TextFormFieldWidget(label: '2547XXXXXXXXX', value: phone),
                              SizedBox(height: 24.0,),
                              Text('Online Therapy Informed Consent'),
                              SizedBox(height: 8.0),
                              InkWell(
                                child: Text('Read consent', style: TextStyle(decoration: TextDecoration.underline, color: Color(0xB3000000)),),

                                onTap: (){
                                  // On pressing the Read consent => serve consent web page

                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    activeColor: Color(0xFF00c853),

                                    value: this.consentCheck,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.consentCheck = value!;
                                      });
                                    },
                                  ),


                                  Text('I agree to chatmate Informed Consent',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Container(
                                  padding: EdgeInsets.only(top: 2.0, right: 16.0, bottom: 2.0, left: 16.0),
                                  decoration: BoxDecoration(color: Color(0xFF00c853), borderRadius: BorderRadius.circular(24.0)),


                                  child: TextButton(
                                    child: Text('SUBMIT',
                                        style: TextStyle(color: Color(0xFFffffff), fontFamily: 'MonospaceBold', fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: 2)),
                                    onPressed: (){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Contact information successfully submitted!',
                                            style: TextStyle(color: Colors.green),
                                            textAlign: TextAlign.center,),
                                            backgroundColor: Color(0xFFffffff),)
                                      );
                                    },
                                  )
                              ),

                            ]
                      ),),
                    ],

                  ),
                )
              ),

              //------------------------------------------------------------------
              // 2. Connect
              Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 16),

                child: StreamBuilder<QuerySnapshot>(
                  stream: _therapistsStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError) {
                      return Center(child: Text('Something went wrong'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: SpinKitCircle(color: Color(0xFF00c853), size: 70.0),);
                    }

                    return ListView(
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        return Container(
                          color: Color(0xFFe2e2e2),
                          child: Column(
                            children: [
                              Container(
                                color: Color(0xFFffffff),

                                child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(20),
                                                width: 90,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(data['imgURL']),
                                                      fit: BoxFit.fill
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 24,),

                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Text(data['name'], style: TextStyle(fontWeight: FontWeight.bold),),
                                                  SizedBox(height: 4.0,),
                                                  Text(data['hospital'], style: TextStyle(color: Color(0xB3000000))),
                                                  Text(data['region'], style: TextStyle(color: Color(0xB3000000))),
                                                ],
                                              )
                                            ],
                                          ),

                                          Container(
                                            padding: EdgeInsets.only(left: 16.0, right: 16.0),

                                            child: Column(
                                              children: [
                                                Text(data['bio']),
                                                SizedBox(height: 16.0),
                                                Row(
                                                  children: [
                                                    Text('Rating: '),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.star, color: Color(0xB3000000)),
                                                        Icon(Icons.star, color: Color(0xB3000000)),
                                                        Icon(Icons.star, color: Color(0xB3000000)),
                                                        Icon(Icons.star_half_outlined, color: Color(0xB3000000)),
                                                        Icon(Icons.star_border, color: Color(0xB3000000)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 16.0),
                                              ],
                                            ),
                                          ),

                                          Divider(height: 4.0,),
                                          SizedBox(height: 16,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: Row(
                                                  children: [
                                                    Transform.rotate(
                                                      angle: 315 * math.pi / 180,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.push_pin_rounded,
                                                          color: Color(0xFF00c853),
                                                        ),
                                                        onPressed: null,
                                                      ),
                                                    ),
                                                    Text('Pin', style: TextStyle(color: Color(0XFF000000), fontWeight: FontWeight.bold),)
                                                  ],
                                                ),
                                              ),

                                              Container(
                                                  padding: EdgeInsets.only(top: 2.0, right: 16.0, bottom: 2.0, left: 16.0),
                                                  decoration: BoxDecoration(color: Color(0xFF00c853), borderRadius: BorderRadius.circular(24.0)),


                                                  child: Row(
                                                    children: [
                                                      TextButton(
                                                        child: Text('${data['phone']}',
                                                            style: TextStyle(color: Color(0xFFffffff), fontFamily: 'MonospaceBold', fontSize: 18.0, fontWeight: FontWeight.bold,)),
                                                        onPressed: (){},
                                                      ),
                                                    ],
                                                  )
                                              )

                                            ],
                                          ),
                                          SizedBox(height: 24,),
                                        ],
                                      )
                                    ],
                                ),

                              ),
                              SizedBox(height: 2)
                            ],
                          ),
                        );
                      }).toList(),
                    );

                  },
                ),

              ),
              //------------------------------------------------------------------

              //------------------------------------------------------------------
              // 3. Payment
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),

                  child: Column(

                    children: [
                      SizedBox(height: 24,),
                      Text('Buy the team a coffee!!!',
                        style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 20.0),
                      ),
                      Image.asset("assets/images/coffee.png", height: 180),
                      // SizedBox(height: 16,),
                      Text('We hope you love the app.', textAlign: TextAlign.center),
                      SizedBox(height: 16),
                      Text('You can buy the team at chatmate a coffee through M-PESA.', textAlign: TextAlign.center),
                      // SizedBox(height: 16),
                      // Divider(height: 4.0,),
                      // SizedBox(height: 16),
                      // Text('Charges:', style: TextStyle(fontFamily: 'MonospaceBold', fontSize: 18.0),),
                      // SizedBox(height: 8.0),
                      // RichText(
                      //   text: TextSpan( style: TextStyle(fontFamily: 'WorkSansMedium', fontSize: 18, color: Colors.black),
                      //     children: <TextSpan>[
                      //       TextSpan(text: 'One time access fee of ', style: TextStyle(color: Color(0xB3000000), fontWeight: FontWeight.bold)),
                      //       TextSpan(text: 'Ksh 1.00',
                      //           style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF009624))),
                      //     ],
                      //   ),
                      // ),

                      SizedBox(height: 16),
                      Divider(height: 4.0,),
                      SizedBox(height: 16),
                      Text('Ksh 1.00 will be directly charged to your M-PESA Account.', textAlign: TextAlign.center,),
                      SizedBox(height: 20),
                      Container(
                          padding: EdgeInsets.only(top: 2.0, right: 16.0, bottom: 2.0, left: 16.0),
                          decoration: BoxDecoration(color: Color(0xFF00c853), borderRadius: BorderRadius.circular(24.0)),


                          child: TextButton(
                            child: Text('Buy',
                                style: TextStyle(color: Color(0xFFffffff), fontFamily: 'MonospaceBold', fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: 2)),
                            onPressed: () async {

                              try{
                                setState(() {
                                  loadingPayment = true;
                                });
                                await processRequest().then((value) => setState(() {  }));

                              } catch(error){
                                loadingPayment = false;
                                print(error);

                              }
                            },
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          isLoading: loadingPayment,
          opacity: 0.8,
          progressIndicator: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SpinKitCircle(color: Color(0xFF00c853), size: 70.0),
              SizedBox(height: 20,),
              Text('Processing Payment', style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 18.0, fontWeight: FontWeight.bold),)
            ],
          ),
          color: Color(0xFFc0c0c0),
        )

      ),
    );
  }
}

class TextFormFieldWidget extends StatefulWidget {
  final label;
  late final value;

  TextFormFieldWidget({this.label, this.value});

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (val) {
        setState(() => widget.value = val);
      },

      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: '${widget.label}', labelStyle: TextStyle(fontSize: 10.0),
        contentPadding: EdgeInsets.only(left: 20, right: 20)
      ),
    );
  }
}
