import 'package:chatmate_login/screens/menu/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math' as math;

class SearchResults extends StatefulWidget {
  final searchItem;

  const SearchResults(this.searchItem);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  var searchItem;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var filteredResults;

  @override
  void initState(){
    searchItem = widget.searchItem;
    filteredResults = FirebaseFirestore.instance.collection('therapists')
        .where('region',  isEqualTo: '$searchItem').get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App Bar
      //------------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        elevation: 2.0,

        toolbarHeight: 72.0,

        titleSpacing: 0,

        title: Container(
          padding: EdgeInsets.only(right: 4.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text('Search Results',
                  style: TextStyle(color: Color(0xFF009624), fontFamily: 'MonospaceBold', fontSize: 20.0, fontWeight: FontWeight.bold)),
              IconButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
                );
              }, icon: Icon(Icons.more_vert, color: Color(0xFF000000), size: 28)),
            ],
          ),
        ),
      ),
      //------------------------------------------------------------------------

      body: Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 16),

        child: FutureBuilder<QuerySnapshot>(
          future: filteredResults,
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
                                        padding: EdgeInsets.only(top: 0.0, right: 16.0, bottom: 0.0, left: 16.0),
                                        decoration: BoxDecoration(border: Border.all(color: Color(0xFF00c853), width: 2.0), borderRadius: BorderRadius.circular(24.0)),

                                        child: TextButton(
                                            onPressed: (){},
                                            child: Text('Connect', style: TextStyle(color: Color(0xBF000000), fontWeight: FontWeight.bold),))
                                    ),

                                  ],
                                ),
                                SizedBox(height: 16,),
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

            // return Text('${snapshot.data!.docs}');


          },
        ),
      ),
    );
  }
}
