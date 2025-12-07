import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String tmdbBaseUrl = 'https://api.themoviedb.org/3';
const String tmdbImageBaseUrl = 'https://image.tmdb.org/t/p/';

String get tmdbApiKey => dotenv.env['TMDB_API_KEY'] ?? '<API KEY ANDA>';

final BaseOptions tmdbBaseOptions = BaseOptions(
  baseUrl: tmdbBaseUrl,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  responseType: ResponseType.json,
);
