import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  static const accessToken = 'pk.eyJ1IjoibWFzdGVyY3JlYSIsImEiOiJjbDF3ZGJ6OWIwMWJ3M2pxcnI0emplM3U0In0.JjZRyI7B5xxD01Y0RkR8rw';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });
    super.onRequest(options, handler);
  }
}