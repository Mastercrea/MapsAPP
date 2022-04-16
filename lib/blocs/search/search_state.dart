part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool displayManualMarker;
  final List<Feature> places;
  final List<Feature> history;

  const SearchState({this.places = const [], this.history = const [], this.displayManualMarker = false});

  SearchState copyWith({bool? displayManualMarker, List<Feature>? places, List<Feature>? history}) =>
      SearchState(
        history: history?? this.history,
          displayManualMarker: displayManualMarker ?? this.displayManualMarker,
          places: places ?? this.places);

  @override
  List<Object> get props => [displayManualMarker, places, history];
}
