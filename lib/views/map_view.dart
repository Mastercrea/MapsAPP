import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../blocs/blocs.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines;
  final Set<Marker> markers;

  const MapView({Key? key, required this.initialLocation, required this.polylines, required this.markers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final CameraPosition initialCameraPosition =
        CameraPosition(target: initialLocation, zoom: 15);
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height,
        width: size.width,
        child: Listener(
          onPointerMove: (event) => mapBloc.add(OnStopFollowingUserEvent()),
          child: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            compassEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            polylines: polylines,
            markers: markers,
            onCameraMove: ( position ) => mapBloc.mapCenter = position.target,
            onMapCreated:(controller) => mapBloc.add(OnMapInitializedEvent(controller)),
          ),
        ));

    //TODO: Markers, Polylines, Map move
  }
}
