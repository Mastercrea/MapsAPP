part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool followUser;

  MapState({this.isMapInitialized = false, this.followUser = false});

  MapState copyWith({bool? isMapInitialized, bool? followUser}) => MapState(
      followUser: followUser ?? this.followUser,
      isMapInitialized: isMapInitialized ?? this.isMapInitialized);

  @override
  List<Object> get props => [isMapInitialized, followUser];
}
