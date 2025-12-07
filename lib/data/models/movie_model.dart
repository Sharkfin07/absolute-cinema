class Movie {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final double? voteAverage;
  final int? voteCount;
  final DateTime? releaseDate;
  final bool? adult;
  final double? popularity;
  final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final bool? video;

  Movie({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.voteCount,
    this.releaseDate,
    this.adult,
    this.popularity,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.video,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? json['name'] as String? ?? 'Unknown',
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      releaseDate: json['release_date'] != null
          ? DateTime.tryParse(json['release_date'] as String)
          : null,
      adult: json['adult'] as bool?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      genreIds: json['genre_ids'] != null
          ? List<int>.from(json['genre_ids'] as List)
          : null,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      video: json['video'] as bool?,
    );
  }

  String get posterUrl {
    if (posterPath == null || posterPath!.isEmpty) {
      return '';
    }
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  // BONUS: Membantu formatting tanggal rilis film
  String get formattedReleaseDate {
    if (releaseDate == null) return 'Unknown';
    return '${releaseDate!.year}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}';
  }
}
