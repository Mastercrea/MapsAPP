import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
          maxRadius: 25,
          backgroundColor: Colors.white,
          child: BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    state.isFollowingUser
                        ? mapBloc.add(OnStopFollowingUserEvent())
                        : mapBloc.add(OnStartFollowingUserEvent());
                  },
                  icon: Icon(
                    state.isFollowingUser
                        ? Icons.directions_run_rounded
                        : Icons.hail_rounded,
                    color: Colors.black,
                  ));
            },
          )),
    );
  }
}
