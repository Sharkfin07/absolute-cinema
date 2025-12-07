import 'package:dio/dio.dart';
import 'package:absolute_cinema/data/helpers/tmdb_client.dart';
import 'package:absolute_cinema/data/models/movie_model.dart';

class TmdbService {
  TmdbService({TmdbClient? client}) : _client = client ?? TmdbClient();

  final TmdbClient _client;

  /// Fetch popular movies from TMDB.
  Future<List<Movie>> fetchPopular({int page = 1}) async {
    final response = await _get(
      '/movie/popular',
      queryParameters: {'page': page},
    );
    return _mapMovies(response);
  }

  /// Search movies by title.
  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    final response = await _get(
      '/search/movie',
      queryParameters: {'query': query, 'include_adult': false, 'page': page},
    );
    return _mapMovies(response);
  }

  Future<Response<dynamic>> _get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _client.dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final reason = e.response?.statusMessage;
      final body = e.response?.data;
      throw Exception(
        'TMDB request failed (${status ?? 'no-status'} ${reason ?? ''}) body=$body error=${e.message}',
      );
    }
  }

  List<Movie> _mapMovies(Response<dynamic> response) {
    final data = response.data;
    if (data == null || data['results'] == null) return [];
    final results = data['results'] as List<dynamic>;
    return results
        .map((raw) => Movie.fromJson(raw as Map<String, dynamic>))
        .toList();
  }
}
