import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {
  final accessToken = 'pk.eyJ1IjoibWFzdGVyY3JlYSIsImEiOiJjbDF3ZGd5ZnAyOGZkM2psbTNibHBpZnZvIn0.PCl9fMnlHr_w8ivvyOMizA';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({'access_token': accessToken,
      'language': 'es',
      'limit': 7
    });



    super.onRequest(options, handler);
  }

}