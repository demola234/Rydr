import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  /// [currentPosition] checks for the latitude and longitude between two locations
  LatLng? currentPosition;

  /// [_controller] Controller for a single GoogleMap instance running on the platforms
  final Completer<GoogleMapController> _controller = Completer();

  /// [markers] defining a Set of Markers
  Set<Marker> markers = {};

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  /// [getCurrentLocation] Retrives the information of the users location
  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      /// Setting the vaule of the LatLng positions
      currentPosition = LatLng(position.latitude, position.longitude);

      /// Adding various Markers to the position of the map
      markers.add(Marker(
          markerId: MarkerId("12"),
          position: currentPosition!,
          infoWindow: InfoWindow(title: "Hello, Ademola")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: currentPosition != null

            /// [GoogleMap]  checks for the type of map,
            /// Initializes the marker on screen an also the camera position for the markers
            ? GoogleMap(
                mapType: MapType.normal,
                markers: markers,
                initialCameraPosition:
                    CameraPosition(target: currentPosition!, zoom: 16),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              )
            : SizedBox.shrink());
  }
}
