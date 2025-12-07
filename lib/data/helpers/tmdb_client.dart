import 'package:dio/dio.dart';
import 'tmdb_config.dart';

/// Lightweight TMDB client wrapper around Dio.
class TmdbClient {
  TmdbClient({Dio? dio}) : _dio = dio ?? Dio(tmdbBaseOptions) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Inject API key and common defaults to every request.
          options.queryParameters = {
            ...options.queryParameters,
            'api_key': tmdbApiKey,
            'language': options.queryParameters['language'] ?? 'en-US',
          };
          return handler.next(options);
        },
        onError: (error, handler) {
          // You can map status codes here if needed.
          return handler.next(error);
        },
      ),
    );
  }

  final Dio _dio;
  Dio get dio => _dio;
}
