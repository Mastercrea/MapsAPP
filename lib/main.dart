import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/screens/screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => GpsBloc(),
    ),
    BlocProvider(
      create: (context) => LocationBloc(),
    ),
    BlocProvider(
      create: (context) => MapBloc(),
    )
  ], child: MapsApp()));
}

class MapsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MapsApp',
        home: LoadingScreen());
  }
}
