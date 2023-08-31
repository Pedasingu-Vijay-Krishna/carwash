import 'dart:async';

import 'package:carwash/Services/ApiProvider.dart';
import 'package:carwash/SharePref/SharePref.dart';
import 'package:carwash/models/AddAddresss.dart';
import 'package:carwash/utils/locationService.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;


  late LatLng _defaultLatLng;
  TextEditingController name = TextEditingController();
  late LatLng _draggedLatlng;
  String _draggedAddress = "";

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    //set default latlng for camera position
    _defaultLatLng = LatLng(17, 73);
    _draggedLatlng = _defaultLatLng;
    _cameraPosition = CameraPosition(
        target: _defaultLatLng,
        zoom: 17.5 // number of map view
    );

    //map will redirect to my current location when loaded
    _gotoUserCurrentPosition();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),backgroundColor: Colors.indigo,title: Text("Add Entity",style: TextStyle(color: Colors.white),),),

      bottomSheet: Container(height: 230,child: Column(
        children: [
          _showDraggedAddress(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(controller: name,decoration: InputDecoration(focusedBorder: OutlineInputBorder(),hintText: "Name Of Location",enabledBorder: OutlineInputBorder()),),
          ),
          ElevatedButton(onPressed: (){

            ApiProvider(context).addUserAddress(AddAddresss(name: name.text,userId:SharePref().getUser()!.id,address: _draggedAddress,latitude: _draggedLatlng.latitude.toString(),longitude: _draggedLatlng.longitude.toString() )).then((value) {


              context.pop();

            });


          }, child: Text("Save Location"))
        ],
      ),),
      body: _buildBody(),
      //get a float button to click and go to current location
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _gotoUserCurrentPosition();
      //   },
      //   child: Icon(Icons.location_on),
      // ),
    );
  }

  Widget _buildBody() {
    return Stack(
        children : [
          _getMap(),
          Positioned(
           top: 20,

            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  GestureDetector(
                    onTap: (){
                      context.pop();

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    ),
                  ),
                    Center(child: Text("Pin Your Location",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),


                    Card(
                      child: IconButton(onPressed: () {

                        _gotoUserCurrentPosition();

                      },icon:  Icon(Icons.location_searching_outlined,color: Colors.red,),),
                    )
                ],),
              ),
            ),
          ),
          // Container(height:200,color:Colors.white,child: Column(children: [
        //   _showDraggedAddress(),
          //
          //
          // ]),),
          _getCustomPin(),

        ]
    );
  }

  Widget _showDraggedAddress() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: BoxDecoration(
     //     color: Colors.indigo,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Set Service Location", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                ),
              //  ElevatedButton(onPressed: (){}, child: Text("Change Location"))
              ],
            ),
            Center(child: Text(_draggedAddress, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),)),
          ],
        ),
      ),
    );
  }

  Widget _getMap() {
    return GoogleMap(
      initialCameraPosition: _cameraPosition!, //initialize camera position for map
      mapType: MapType.hybrid,
      onCameraIdle: () {
        //this function will trigger when user stop dragging on map
        //every time user drag and stop it will display address
        _getAddress(_draggedLatlng);
      },
      onCameraMove: (cameraPosition) {
        //this function will trigger when user keep dragging on map
        //every time user drag this will get value of latlng
        _draggedLatlng = cameraPosition.target;
      },
      onMapCreated: (GoogleMapController controller) {
        //this function will trigger when map is fully loaded
        if (!_googleMapController.isCompleted) {
          //set controller to google map when it is fully loaded
          _googleMapController.complete(controller);
        }
      },
    );
  }

  Widget _getCustomPin() {
    return Positioned(
      child: Center(
        child: Container(
          width: 150,
          child: Icon(Icons.location_on,size: 40,color: Colors.red,),
        ),
      ),
    );
  }

  //get address from dragged pin
  Future _getAddress(LatLng position) async {
    //this will list down all address around the position
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    // debugPrint(placemarks.toList().toString());
    Placemark address = placemarks[0]; // get only first and closest address
    String addresStr = "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
    setState(() {
      _draggedAddress = addresStr;
    });
  }

  //get user's current location and set the map's camera to that location
  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  //go to specific position by latlng
  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: position,
            zoom: 17.5
        )
    ));
    //every time that we dragged pin , it will list down the address here
    await _getAddress(position);
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if(!isLocationServiceEnabled) {
      print("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();

    //check if user denied location and retry requesting for permission
    if(locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied) {
        print("user denied location permission");
      }
    }

    //check if user denied permission forever
    if(locationPermission == LocationPermission.deniedForever) {
      print("user denied permission forever");
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

}