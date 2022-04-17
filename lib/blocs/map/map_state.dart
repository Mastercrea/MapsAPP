part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool showMyRoute;

  // Polylines
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;

  const MapState(
      {this.isMapInitialized = false,
      this.isFollowingUser = true,
      this.showMyRoute = true,
      Map<String, Polyline>? polylines,
      Map<String, Marker>? markers})
      : polylines = polylines ?? const {},
        markers = markers ?? const {};

  MapState copyWith(
          {bool? isMapInitialized,
          bool? isFollowingUser,
          bool? showMyRoute,
          Map<String, Polyline>? polylines,
          Map<String, Marker>? markers}) =>
      MapState(
          isFollowingUser: isFollowingUser ?? this.isFollowingUser,
          isMapInitialized: isMapInitialized ?? this.isMapInitialized,
          showMyRoute: showMyRoute ?? this.showMyRoute,
          polylines: polylines ?? this.polylines,
          markers: markers ?? this.markers);

  @override
  List<Object> get props =>
      [isMapInitialized, isFollowingUser, showMyRoute, polylines, markers];
}
