import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  final accessToken = 'pk.eyJ1IjoibWFzdGVyY3JlYSIsImEiOiJjbDF3ZGd5ZnAyOGZkM2psbTNibHBpZnZvIn0.PCl9fMnlHr_w8ivvyOMizA';
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