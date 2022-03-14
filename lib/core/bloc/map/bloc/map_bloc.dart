// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:rydr/core/services/map_services.dart';
// import 'package:rydr/models/address_model.dart';

// part 'map_event.dart';
// part 'map_state.dart';

// class MapBloc extends Bloc<MapEvent, MapState> {
//   final currentPosition = MapService.instance?.currentPosition;
//   MapBloc() : super(MapInitial()) {
//     on<MapEvent>((event, emit) {
//       @override
//       Stream<MapState> mapEventToState(MapEvent event) async* {
//         if (event is LoadMyPosition) {
//           yield* _loadPosition(event);
//         } else if (event is SearchAddress) {
//           yield* _searchAddress(event.query);
//         } else if (event is LoadRouteCoordinates) {
//           yield* _getRoute(event);
//         }
//       }
//     });
//   }

//   Stream<MapState> _loadPosition(LoadMyPosition event) async* {
//     if (event.latLng == null) {
//       await MapService.instance?.getCurrentPosition();
//       MapService.instance?.listenToPositionChanges();
//       yield LoadedCurrentPosition(currentPosition?.value);
//     } else {
//       final myPosition = await MapService.instance?.getPosition(event.latLng!);
//       yield LoadedCurrentPosition(myPosition);
//     }
//   }

//   Stream<MapState> _searchAddress(String query) async* {
//     await MapService.instance?.getAddressFromQuery(query);
//     yield LoadedSearchAddressResults(MapService.instance?.searchedAddress);
//   }

//   Stream<MapState> _getRoute(LoadRouteCoordinates event) async* {
//     final endAddress = await MapService.instance
//         ?.getRouteCoordinates(event.startLatLng, event.endLatLng);
//     yield LoadedRoutes(currentPosition!.value!, endAddress!);
//   }
// }