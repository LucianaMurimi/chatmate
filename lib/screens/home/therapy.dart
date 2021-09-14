import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatmate_login/screens/menu/menu.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;
import '../../services/daraja.dart';

class Therapy extends StatefulWidget {
  const Therapy({Key? key}) : super(key: key);

  @override
  _TherapyState createState() => _TherapyState();
}

class _TherapyState extends State<Therapy> {
  String email = '';
  var phone;
  bool consentCheck = false;

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
                }, icon: Icon(Icons.more_vert, size: 32)),

              ],
            ),
          ),

          bottom: TabBar(
            indicatorWeight: 2,
            indicatorColor: Color(0xFF00c853),

            tabs: [
              Tab(child: Text('Contact',
                style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 14.0),
              ),),
              Tab(child: Text('Payment',
                style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 14.0),
              ),),
              Tab(child: Text('Connect',
                style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 14.0),
              ),),
            ],
          ),
        ),
        //------------------------------------------------------------------------
        body: TabBarView(
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
                    Text('Step 1: Contact Information',
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
            // 2. Payment
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),

                child: Column(

                  children: [
                    SizedBox(height: 24,),
                    Text('Step 2: Payment',
                      style: TextStyle(color: Color(0xFF000000), fontFamily: 'MonospaceBold', fontSize: 18.0),
                    ),
                    SizedBox(height: 16,),
                    Text('Chatmate Therapist Connect service brings you a specially curated list of the best therapists near you.'
                        ' Putting you in touch with the best professionals in the field.', textAlign: TextAlign.center),
                    SizedBox(height: 16),
                    Divider(height: 4.0,),
                    SizedBox(height: 16),
                    Text('Charges:', style: TextStyle(fontFamily: 'MonospaceBold', fontSize: 18.0),),
                    SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan( style: TextStyle(fontFamily: 'WorkSansMedium', fontSize: 18, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: 'One time access fee of ', style: TextStyle(color: Color(0xB3000000), fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Ksh 1.00',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF009624))),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),
                    Divider(height: 4.0,),
                    SizedBox(height: 16),
                    Text('Confirm payment of Ksh 1.00 to access Chatmate Therapist Connect service. This amount will be charged to your M-PESA Account.', textAlign: TextAlign.center,),
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.only(top: 2.0, right: 16.0, bottom: 2.0, left: 16.0),
                        decoration: BoxDecoration(color: Color(0xFF00c853), borderRadius: BorderRadius.circular(24.0)),


                        child: TextButton(
                          child: Text('CONFIRM',
                              style: TextStyle(color: Color(0xFFffffff), fontFamily: 'MonospaceBold', fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: 2)),
                          onPressed: (){
                            // Get daraja service
                            getClientCredentials();
                            processRequest();

                          },
                        )
                    ),
                  ],
                ),
              ),
            ),

            //------------------------------------------------------------------
            // 3. Connect
            SingleChildScrollView(
              child: Card(
                child: Container(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 16),

                  child: Column(

                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              // Image.asset("assets/images/profile.jpg",),
                              Container(
                                margin: EdgeInsets.all(20),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                                      fit: BoxFit.fill
                                  ),
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text('Jane Doe', style: TextStyle(fontWeight: FontWeight.bold),),
                                  SizedBox(height: 4.0,),
                                  Text('Karen Hospital', style: TextStyle(color: Color(0xB3000000))),
                                  Text('Nairobi', style: TextStyle(color: Color(0xB3000000))),
                                ],
                              )
                            ],
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0),

                            child: Column(
                              children: [
                                Text('A Family and Marriage Therapist with 6 years of experience.'
                                    'Trained in a range of modalities including Gestalt Therapy and NARM somantic approaches'),
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
                                          color: Color(0xFF009624),
                                        ),
                                        onPressed: null,
                                      ),
                                    ),
                                    Text('Pin', style: TextStyle(color: Color(0XFF000000), fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 0.0, right: 16.0, bottom: 0.0, left: 16.0),
                                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF009624), width: 2.0), borderRadius: BorderRadius.circular(24.0)),

                                  child: TextButton(
                                      onPressed: (){},
                                      child: Text('Connect', style: TextStyle(color: Color(0xBF000000), fontWeight: FontWeight.bold),))
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            //------------------------------------------------------------------
          ],
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
