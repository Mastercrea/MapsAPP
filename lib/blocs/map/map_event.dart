part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object?> get props => [];
}

class OnMapInitializedEvent extends MapEvent {
  final GoogleMapController controller;

  const OnMapInitializedEvent(this.controller);
}

class OnStartFollowingUserEvent extends MapEvent {}

class OnStopFollowingUserEvent extends MapEvent {}

class UpdateUserPolylinesEvent extends MapEvent {
  final List<LatLng> userLocations;

  const UpdateUserPolylinesEvent(this.userLocations);
}

class OnToggleUserRoute extends MapEvent {}

class DisplayPolylinesEvents extends MapEvent {
  final Map<String, Polyline> polylines;

  DisplayPolylinesEvents(this.polylines);
}
