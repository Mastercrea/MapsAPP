import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';

class BtnToggleUserRoute extends StatelessWidget {
  const BtnToggleUserRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
          maxRadius: 25,
          backgroundColor: Colors.white,
          child: IconButton(
              onPressed: () {
                mapBloc.add(OnToggleUserRoute());
              },
              icon: Icon(
                Icons.more_horiz_rounded,
                color: Colors.black,
              ))),
    );
  }
}
