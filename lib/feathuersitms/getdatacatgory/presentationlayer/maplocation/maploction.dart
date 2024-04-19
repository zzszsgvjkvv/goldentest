import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location services are disabled")));
    return Future.error('Location services are disabled.');
  }
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("Location services are enabled")));
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location services are disabled")));
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

// ignore: must_be_immutable
class Maploction extends StatefulWidget {
final void Function(double x,double y) location;
   const Maploction( {super.key, required this.location, });

  @override
  State<Maploction> createState() => _MaploctionState();
}

class _MaploctionState extends State<Maploction> {
  @override
  void initState() {
    _determinePosition(context);
    super.initState();
  }

  static const LatLng _pgoogleplex = LatLng(48.119168, 53.735165);
  GoogleMapController? gmc;
  late final Marker _marker;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body:Container(
        width: double.infinity,
        height:700,
       
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextButton(onPressed: (){
        Navigator.pop(context);
              }, child: Text("back", style: TextStyle(fontSize: 20,color: Colors.white),)),
             SizedBox(height: 20,),
              SizedBox(
             width: double.infinity,
        height: 400,
                child:
                 
                    GoogleMap(
                      onTap: (argument) {
                        _marker = Marker(
                            markerId: MarkerId("value"),
                            position: LatLng(argument.latitude, argument.longitude));
               widget.location( _marker.position.latitude,
                  _marker.position.latitude);
                      },
                      markers: {
                        const Marker(
                            markerId: MarkerId("1"), position: LatLng(48.119168, 53.735165))
                      },
                      initialCameraPosition:
                          const CameraPosition(target: _pgoogleplex, zoom: 0.0),
                      onMapCreated: (controller) {
                        gmc = controller;
                      },
                    ),
                
              ),
            ],
          ),
        ),
      )
    ;
  }
}
/*
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
} */
