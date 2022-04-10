import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../blocs/blocs.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;

  const MapView({Key? key, required this.initialLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final CameraPosition initialCameraPosition =
        CameraPosition(target: initialLocation, zoom: 15);
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height,
        width: size.width,
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          compassEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated:(controller) => mapBloc.add(OnMapInitializedEvent(controller)),
        ));

    //TODO: Markers, Polylines, Map move
  }
}
