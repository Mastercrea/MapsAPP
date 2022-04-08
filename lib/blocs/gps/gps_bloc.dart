import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps_state.dart';
part 'gps_event.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription? gpsServiceSubscription;
  GpsBloc() : super(GpsState(isGpsEnabled: false, isGpsPermissionGranted: false)) {
    // on<GpsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<GpsAndPermissionEvent>((event, emit) => emit(state.copyWith(isGpsEnabled: event.isGpsEnabled, isGpsPermissionGranted: event.isGpsPermissionGranted)));
    
    _init();
  }

  Future <void> _init() async{
    // Init status
    // final isEnable = await _checkGpsStatus();
    // final isGranted = await _isPermissionGranted();
    // create a list of Future
    final List<bool> gpsInitStatus = await Future.wait([
      _checkGpsStatus(),
      _isPermissionGranted()
    ]);
    // print('isEnable: ${gpsInitStatus[0]} isGranted: ${gpsInitStatus[1]}');
    add(GpsAndPermissionEvent(isGpsPermissionGranted: gpsInitStatus[1], isGpsEnabled: gpsInitStatus[0]));

  }
  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
    gpsServiceSubscription = Geolocator.getServiceStatusStream().listen((event) {
      // running status
      final isEnabled = (event.index == 1) ? true : false;
      add(GpsAndPermissionEvent(isGpsPermissionGranted: state.isGpsPermissionGranted, isGpsEnabled: isEnabled));
      // print('Service status $isEnabled');
    });
    return isEnable;
  }


  Future<bool> _isPermissionGranted()async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();
    switch(status){
      case PermissionStatus.granted:
        add(GpsAndPermissionEvent(isGpsPermissionGranted: true, isGpsEnabled: state.isGpsEnabled));
         // print('isGpsPermissionGranted: ${state.isGpsPermissionGranted} isGpsEnabled: ${state
         //    .isGpsEnabled}');
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      add(GpsAndPermissionEvent(isGpsPermissionGranted: false, isGpsEnabled: state.isGpsEnabled));
      openAppSettings();
    }
  }

  @override
  Future<void> close() {
    gpsServiceSubscription?.cancel();
    return super.close();
  }
}
