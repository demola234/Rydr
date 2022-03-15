// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:rydr/core/bloc/map/bloc/map_bloc.dart';
// import 'package:rydr/core/services/map_services.dart';
// import 'package:rydr/models/address_model.dart';
// import 'package:rydr/utils/custom_text_field.dart';
// import 'package:rydr/views/mapView/info_window/custom_info_window.dart';

// class MapView extends StatefulWidget {
//   const MapView({Key? key}) : super(key: key);

//   @override
//   _MapViewState createState() => _MapViewState();
// }

// class _MapViewState extends State<MapView> {
//   final currentAddressController = TextEditingController();
//   final destinationAddressController = TextEditingController();
//   GoogleMapController? _controller;

//   List<Address> searchedAddress = [];

//   MapBloc bloc = MapBloc();

//   FocusNode? _focusNode;

//   /// [markers] defining a Set of Markers
//   Set<Marker> markers = {};

//   @override
//   void initState() {
//     _focusNode = FocusNode();
//     bloc.add(LoadMyPosition());

//     super.initState();
//   }

//   @override
//   void dispose() {
//     bloc.close();
//     MapService.instance?.controller.dispose();
//     super.dispose();
//   }

//   _animateCamera(LatLng latLng) async {
//     await _controller?.animateCamera(CameraUpdate.newCameraPosition(
//       CameraPosition(
//           target: LatLng(latLng.latitude, latLng.longitude), zoom: 16.5),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<MapBloc>(
//       create: (context) => bloc,
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: BlocConsumer<MapBloc, MapState>(
//             listener: (context, state) {
//               if (state is LoadedCurrentPosition) {
//                 setState(() {
//                   currentAddressController.text =
//                       "${state.address?.street}, ${state.address?.city}";
//                 });
//               }
//             },
//             bloc: bloc,
//             builder: (context, state) {
//               if (state is LoadingCurrentPosition) {
//                 return Center(child: const CircularProgressIndicator());
//               } else if (state is LoadedCurrentPosition ||
//                   state is LoadedSearchAddressResults ||
//                   state is LoadedRoutes) {
//                 final address = state is LoadedCurrentPosition
//                     ? state.address
//                     : MapService.instance?.currentPosition?.value;
//                 return Stack(
//                   children: [
//                     Builder(builder: (context) {
//                       return GoogleMap(
//                         mapType: MapType.normal,
//                         polylines: {
//                           if (state is LoadedRoutes)
//                             if (state.endAddress.polylines != [])
//                               Polyline(
//                                 polylineId:
//                                     const PolylineId('overview_polyline'),
//                                 color: Colors.black,
//                                 width: 5,
//                                 points: state.endAddress.polylines
//                                     .map((e) => LatLng(e.latitude, e.longitude))
//                                     .toList(),
//                               ),
//                         },
//                         markers: MapService.instance?.markers.value ?? {},
//                         initialCameraPosition:
//                             CameraPosition(target: address!.latLng!, zoom: 15),
//                         onMapCreated: (GoogleMapController controller) {
//                           setState(() {
//                             _controller = controller;
//                             MapService.instance?.controller
//                                 .googleMapController = controller;
//                           });
//                           _animateCamera(address.latLng!);
//                         },
//                         onTap: (position) {
//                           MapService.instance?.controller.hideInfoWindow!();
//                         },
//                         onCameraMove: (controller) {
//                           MapService.instance?.controller.onCameraMove!();
//                         },
//                       );
//                     }),
//                     CustomInfoWindow(
//                       controller: MapService.instance!.controller,
//                       height: MediaQuery.of(context).size.width * 0.12,
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       offset: 50,
//                     ),
//                     Positioned(
//                       top: 10,
//                       left: 15,
//                       right: 15,
//                       child: SafeArea(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: ColorPath.Primarywhite,
//                             borderRadius: BorderRadius.circular(6),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black.withOpacity(.2),
//                                   spreadRadius: 2,
//                                   blurRadius: 5),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Icon(Icons.circle,
//                                           size: 16, color: Colors.blue),
//                                       Container(
//                                           width: 4,
//                                           height: 40,
//                                           color: Colors.blue),
//                                       Icon(Icons.place, color: Colors.blue),
//                                     ],
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       children: [
//                                         Focus(
//                                           focusNode: _focusNode,
//                                           child: CustomTextField(
//                                             label: 'My Address',
//                                             controller:
//                                                 currentAddressController,
//                                             onChanged: (v) {
//                                               bloc.add(SearchAddress(v));
//                                             },
//                                           ),
//                                         ),
//                                         Focus(
//                                           focusNode: _focusNode,
//                                           child: CustomTextField(
//                                             label: 'Destination Address',
//                                             controller:
//                                                 destinationAddressController,
//                                             onChanged: (v) {
//                                               bloc.add(SearchAddress(v));
//                                               setState(() {
//                                                 searchedAddress = MapService
//                                                         .instance
//                                                         ?.searchedAddress
//                                                         .where((q) =>
//                                                             v.contains(
//                                                                 "${q.street}") ||
//                                                             v.contains(
//                                                                 "${q.city}"))
//                                                         .toList() ??
//                                                     [];
//                                               });
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Builder(builder: (context) {
//                                 if (state is LoadedSearchAddressResults) {
//                                   print(state.address);
//                                   return Container(
//                                     width: double.infinity,
//                                     height: 350,
//                                     color: Colors.grey.withOpacity(.1),
//                                     child: ListView.builder(
//                                       shrinkWrap: true,
//                                       itemCount: searchedAddress.length,
//                                       itemBuilder: (context, index) {
//                                         final address = searchedAddress[index];
//                                         return ListTile(
//                                           title: Text(
//                                               '${address.street}, ${address.city}'),
//                                           subtitle: Text(
//                                               '${address.state}, ${address.country}'),
//                                           trailing: Icon(Icons.place_outlined,
//                                               size: 12),
//                                           onTap: () {
//                                             _focusNode?.unfocus();

//                                             bloc.add(LoadMyPosition(
//                                                 latLng: address.latLng));
//                                             if (currentAddressController
//                                                     .text.isNotEmpty &&
//                                                 destinationAddressController
//                                                     .text.isEmpty) {
//                                               setState(() {
//                                                 currentAddressController.text =
//                                                     "${address.street}, ${address.city}";
//                                                 MapService
//                                                     .instance
//                                                     ?.currentPosition
//                                                     ?.value = address;
//                                               });
//                                               _animateCamera(address.latLng!);
//                                             } else if (currentAddressController
//                                                     .text.isNotEmpty &&
//                                                 destinationAddressController
//                                                     .text.isNotEmpty) {
//                                               bloc.add(LoadRouteCoordinates(
//                                                   MapService
//                                                       .instance!
//                                                       .currentPosition!
//                                                       .value!
//                                                       .latLng!,
//                                                   address.latLng!));
//                                               _animateCamera(address.latLng!);
//                                             }
//                                           },
//                                         );
//                                       },
//                                     ),
//                                   );
//                                 } else {
//                                   return SizedBox.shrink();
//                                 }
//                               }),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               } else {
//                 return SizedBox.shrink(
//                   child: Center(
//                     child: Text("Error"),
//                   ),
//                 );
//               }
//             }),
//       ),
//     );
//   }
// }
