import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/ui/custom_snackbar.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
          maxRadius: 25,
          backgroundColor: Colors.white,
          child: IconButton(
              onPressed: () {
                final userLocation = locationBloc.state.lastKnownLocation;

                 if(userLocation ==null) {
                   SnackBar snackBar = CustomSnackbar(message: 'Not position');

                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                   return;
                 }
                mapBloc.moveCamera(userLocation);

              },
              icon: const Icon(
                Icons.my_location_outlined,
                color: Colors.black,
              ))),
    );
  }
}
