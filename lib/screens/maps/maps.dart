import 'package:chatmate_login/screens/home/home.dart';
import 'package:chatmate_login/screens/menu/menu.dart';
import 'package:chatmate_login/screens/support/depressionchat.dart';
import 'package:chatmate_login/screens/support/groups.dart';
import 'package:chatmate_login/services/auth.dart';
import 'package:chatmate_login/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health Clinics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMapsPage(title: 'Mental Health Clinics'),
    );
  }
}

class MyMapsPage extends StatefulWidget {
  MyMapsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyMapsPageState createState() => _MyMapsPageState();
}

class _MyMapsPageState extends State<MyMapsPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-3.3869, 36.6830),
    zoom: 11.5,
  );
  Location location = new Location();
  late String Lat = '';
  late String Lon = '';

  late GoogleMapController mapController;
  LatLng _center = const LatLng(6.3690, 34.8888);
  Location _location = Location();

  late GoogleMapController _googleMapController;

  // late Directions _info;

  @override
  void dispose(){
    _googleMapController.dispose();
    super.dispose();
  }

  //NM-AIST marker
  Marker _nm_aistMarker = Marker(
    markerId: MarkerId("NM-AIST"),
    infoWindow: const InfoWindow(title: "NM-AIST"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(-3.3991307, 36.7968317),
  );

  //Meru district hospital			3.3705° S, 36.7871° E
  Marker _meru_district_hospitalMarker = Marker(
    markerId: MarkerId("Meru district hospital"),
    infoWindow: const InfoWindow(title: "Meru district hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(-3.3705, 36.7871),
  );

  // Old Arusha Clinic			3.3782° S, 36.6983° E
  Marker _old_arusha_clinicMarker = Marker(
    markerId: MarkerId("Old Arusha Clinic"),
    infoWindow: const InfoWindow(title: "Old Arusha Clinic"),
    position: LatLng(-3.3782, 36.6983),
  );

  // Health-4-All Multispecialty Clinic	3.3738° S, 36.6996° E
  Marker _Health_4_All_multispecialty_clinicMarker = Marker(
    markerId: MarkerId("Health-4-All Multispecialty Clinic"),
    infoWindow: const InfoWindow(title: "Health-4-All Multispecialty Clinic"),
    position: LatLng(-3.3738, 36.6996),
  );

  // Total Care Health Center		3.3906° S, 36.7047° E
  Marker _total_care_health_centerMarker = Marker(
    markerId: MarkerId("Total Care Health Center"),
    infoWindow: const InfoWindow(title: "Total Care Health Center"),
    position: LatLng(-3.3906, 36.7047),
  );

  // The Chipuka Center			3.3948° S, 36.6328° E
  Marker _the_chipuka_centerMarker = Marker(
    markerId: MarkerId("The Chipuka Center"),
    infoWindow: const InfoWindow(title: "The Chipuka Center"),
    position: LatLng(-3.3948, 36.6328),
  );

  // Moyo Medicare Specialized Clinic	3.3644° S, 36.6976° E
  Marker _moyo_medicare_specialized_clinicMarker = Marker(
    markerId: MarkerId("Moyo Medicare Specialized Clinic"),
    infoWindow: const InfoWindow(title: "Moyo Medicare Specialized Clinic"),
    position: LatLng(-3.3644, 36.6976),
  );

  // Selian Lutheran Hospital		3.3252° S, 36.6501° E
  Marker _selian_lutheran_hospitalMarker = Marker(
    markerId: MarkerId("Selian Lutheran Hospital"),
    infoWindow: const InfoWindow(title: "Selian Lutheran Hospital"),
    position: LatLng(-3.3252, 36.6501),
  );

  // SMART POLYCLINIC			3.3716° S, 36.6988° E
  Marker _SMART_POLYCLINIC_Marker = Marker(
    markerId: MarkerId("SMART POLYCLINIC"),
    infoWindow: const InfoWindow(title: "SMART POLYCLINIC"),
    position: LatLng(-3.3716, 36.6988),
  );

  // Arusha Lutheran Medical Centre		3.3664° S, 36.6824° E
  Marker _arusha_lutheran_medical_centreMarker = Marker(
    markerId: MarkerId("Arusha Lutheran Medical Centre"),
    infoWindow: const InfoWindow(title: "Arusha Lutheran Medical Centre"),
    position: LatLng(-3.3664, 36.6824),
  );

  // Mount Meru Regional Referral Hospital	3.3660° S, 36.6947° E
  Marker _mount_meru_regional_referral_hospitalMarker = Marker(
    markerId: MarkerId("Arusha Lutheran Medical Centre"),
    infoWindow: const InfoWindow(title: "Arusha Lutheran Medical Centre"),
    position: LatLng(-3.3660, 36.6947),
  );

  // Centre For Educational Development In Health, Arusha (CEDHA)		3.3621° S, 36.6946° E
  Marker _centre_for_educational_development_in_health_arushaMarker = Marker(
    markerId: MarkerId("Centre For Educational Development In Health, Arusha (CEDHA)"),
    infoWindow: const InfoWindow(title: "Centre For Educational Development In Health, Arusha (CEDHA)"),
    position: LatLng(-3.3621, 36.6946),
  );

  // ELCT Health Department			3.3806° S, 36.6983° E
  Marker _ELCT_health_departmentMarker = Marker(
    markerId: MarkerId("ELCT Health Department"),
    infoWindow: const InfoWindow(title: "ELCT Health Department"),
    position: LatLng(-3.3806, 36.6983),
  );

  // ULY CLINIC				3.3869° S, 36.6830° E
  Marker _ULY_CLINIC_Marker = Marker(
    markerId: MarkerId("ULY CLINIC"),
    infoWindow: const InfoWindow(title: "ULY CLINIC"),
    position: LatLng(-3.3869, 36.6830),
  );

  // Themi Hospital				3.3983° S, 36.7012° E
  Marker _themi_hospitalMarker = Marker(
    markerId: MarkerId("Themi Hospital"),
    infoWindow: const InfoWindow(title: "Themi Hospital"),
    position: LatLng(-3.3983, 36.7012),
  );

  // EGPAF					3.3755° S, 36.6992°
  Marker _EGPAF_Marker = Marker(
    markerId: MarkerId("EGPAF"),
    infoWindow: const InfoWindow(title: "EGPAF"),
    position: LatLng(-3.3755, 36.6992),
  );

  // NSK Hospital Arusha			3.3806° S, 36.6848° E
  Marker _NSK_hospital_arushaMarker = Marker(
    markerId: MarkerId("NSK Hospital Arusha"),
    infoWindow: const InfoWindow(title: "NSK Hospital Arusha"),
    position: LatLng(-3.3806, 36.6848),
  );

  @override
  void initState(){
    _getLocationData ();
    super.initState();
  }

  Future<void> _getLocationData () async {
    LocationData loc = await location.getLocation();
    setState(() {
      Lat =loc.latitude.toString();
      Lon=loc.longitude.toString();
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    _location.onLocationChanged.listen((event) {
      Marker myLocation = Marker(
        markerId: MarkerId("Current Location"),
        infoWindow: const InfoWindow(title: "Current Location"),
        position: LatLng(double.parse(event.latitude.toString()), double.parse(event.longitude.toString())));

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(double.parse(event.latitude.toString()), double.parse(event.longitude.toString())), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      //------------------------------------------------------------
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
      //------------------------------------------------------------

      body: SingleChildScrollView(
        child: Column(
            children:[
              SizedBox(
                width:400.0,
                height: 700.0,
                child:
                GoogleMap(
                  initialCameraPosition: _initialCameraPosition,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (controller) => _googleMapController = controller,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  // trafficEnabled: true,
                  markers: {
                    if(_nm_aistMarker != null) _nm_aistMarker,
                    if(_meru_district_hospitalMarker != null) _meru_district_hospitalMarker,
                    if(_old_arusha_clinicMarker != null) _old_arusha_clinicMarker,
                    if(_Health_4_All_multispecialty_clinicMarker != null) _Health_4_All_multispecialty_clinicMarker,
                    if(_total_care_health_centerMarker != null) _total_care_health_centerMarker,
                    if(_the_chipuka_centerMarker != null) _the_chipuka_centerMarker,
                    if(_moyo_medicare_specialized_clinicMarker != null) _moyo_medicare_specialized_clinicMarker,
                    if(_selian_lutheran_hospitalMarker != null) _selian_lutheran_hospitalMarker,
                    if(_SMART_POLYCLINIC_Marker != null) _SMART_POLYCLINIC_Marker,
                    if(_arusha_lutheran_medical_centreMarker != null) _arusha_lutheran_medical_centreMarker,
                    if(_mount_meru_regional_referral_hospitalMarker != null) _mount_meru_regional_referral_hospitalMarker,
                    if(_centre_for_educational_development_in_health_arushaMarker != null) _centre_for_educational_development_in_health_arushaMarker,
                    if(_ELCT_health_departmentMarker != null) _ELCT_health_departmentMarker,
                    if(_ULY_CLINIC_Marker != null) _ULY_CLINIC_Marker,
                    if(_themi_hospitalMarker != null) _themi_hospitalMarker,
                    if(_EGPAF_Marker != null) _EGPAF_Marker,
                    if(_NSK_hospital_arushaMarker != null) _NSK_hospital_arushaMarker,
                  },
                  // polylines: {
                  //   if (_info != null)
                  //     Polyline(
                  //       polylineId: const PolylineId('overview_polyline'),
                  //       color: Colors.red,
                  //       width: 5,
                  //       points: _info.polylinePoints
                  //           .map((e) => LatLng(e.latitude, e.longitude))
                  //           .toList(),
                  //     ),
                  // },
                ),
              ),
            ]

        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
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
                IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);}, icon: Icon(Icons.home, size: 26.0)),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined, size: 26.0)),
                IconButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Maps()));
                }, icon: Icon(Icons.directions_sharp, size: 26.0)),
                IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Groups()),);}, icon: Icon(Icons.people_alt_outlined, size: 26.0)),
                IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Depression()));}, icon: Icon(Icons.chat_bubble_outline, size: 26.0)),
              ],

            ),
          )
      ),
    );
  }
}
