import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapPage extends StatelessWidget {
  static final _initialCameraPosition = LatLng(30.02723747501501, 31.49175788165339);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
            onPressed: ()=> Navigator.pop(context),
          ),
          backgroundColor:Color(0xff8d0000) ,
          centerTitle: true,
          title: Text ('ATM/Branch locators'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
      body: FlutterMap(
        options: MapOptions(

          center: LatLng(30.02724, 31.49176),
          zoom: 12.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [

              Marker(
                point: LatLng(30.02724, 31.49176),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.red,size: 40),

              ),
              Marker(
                point: LatLng(30.044448206444173, 31.23571044747909),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.red,size: 40),
              ),
              Marker(
                point: LatLng(30.042246781777738, 31.20031061097134),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.red,size: 40),
              ),
              Marker(
                point: LatLng(29.840083162351362, 31.298228351292252),
                builder: (ctx) => Icon(Icons.location_pin,color: Colors.red,size: 40),
              ),
              Marker(
                point: LatLng(30.228253178068538, 31.470050126450623),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.red,size: 40),
              ),
              Marker(
                point: LatLng(30.017408164056874, 31.169730618020598),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.red,size: 40),
              ),
              Marker(
                point: LatLng(30.02527931813745, 31.402829268642677),
                builder: (ctx) => Icon(Icons.location_pin,color: Colors.red,size: 40),
              ),
              Marker(
                point: LatLng(29.93176736177019, 30.912083875593233),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.red,size: 40),
              ),
              Marker(
                point: LatLng(29.980088,31.132545),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.blue,size: 40),
              ),
              Marker(
                point: LatLng(30.04648250783858, 31.48416642816627),
                builder: (ctx) => Icon(Icons.location_pin,color: Colors.blue,size: 40),
              ),
              Marker(
                point: LatLng(30.08121306491853, 31.501625866792885),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.blue,size: 40),
              ),
              Marker(
                point: LatLng(30.04742044421188, 31.489187485837977),
                builder: (ctx) => Icon(Icons.location_pin,color: Colors.red,size: 40),
              ),

              Marker(
                point: LatLng(30.092936657439065, 31.38400399748027),
                builder: (ctx) => Icon(Icons.location_pin,color: Colors.red,size: 40),
              ),
              Marker(
                point: LatLng(30.048503661334387, 30.97514830927521),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.blue,size: 40),
              ),
              Marker(
                point: LatLng(30.041368621019643, 31.475143797479006),
                builder: (ctx) => Icon(Icons.location_pin,color: Colors.blue,size: 40),
              ),
              Marker(
                point: LatLng(30.0291930803126, 31.482795753299275),
                builder: (ctx) => Icon(Icons.location_pin, color: Colors.blue,size: 40),
              ),


            ],
          ),
        ],
      ),bottomSheet: (
        Container(
          color: Colors.white38,
        child: Row(
          children: [
            ClipOval(
              child: Container(
                color: Colors.red,
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 15,),
            Text('Branch',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            SizedBox(width: 200,),
            ClipOval(
              child: Container(
                color: Colors.blue,
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 15,),
            Text('ATM',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
        )
        ),

    );
  }
}