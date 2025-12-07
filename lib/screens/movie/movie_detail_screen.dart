import 'package:absolute_cinema/data/helpers/tmdb_config.dart';
import 'package:absolute_cinema/data/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backdropUrl =
        movie.backdropPath != null && movie.backdropPath!.isNotEmpty
        ? '${tmdbImageBaseUrl}w780${movie.backdropPath}'
        : '';
    final posterUrl = movie.posterUrl;

    return Scaffold(
      appBar: AppBar(title: Text(movie.title, overflow: TextOverflow.ellipsis)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (backdropUrl.isNotEmpty)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  backdropUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _backdropPlaceholder(theme),
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return _backdropPlaceholder(theme);
                  },
                ),
              )
            else
              _backdropPlaceholder(theme),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: posterUrl.isNotEmpty
                        ? Image.network(
                            posterUrl,
                            width: 120,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                _posterPlaceholder(theme),
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return _posterPlaceholder(theme);
                            },
                          )
                        : _posterPlaceholder(theme),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (movie.voteAverage != null)
                              _pill(
                                context,
                                icon: Icons.star,
                                label: movie.voteAverage!.toStringAsFixed(1),
                              ),
                            if (movie.releaseDate != null) ...[
                              const SizedBox(width: 8),
                              _pill(
                                context,
                                icon: Icons.event,
                                label: movie.formattedReleaseDate,
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 8),
                        if (movie.originalLanguage != null)
                          Text('Original language: ${movie.originalLanguage}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Overview',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                movie.overview?.isNotEmpty == true
                    ? movie.overview!
                    : 'No overview available.',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _pill(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 6),
          Text(label, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _posterPlaceholder(ThemeData theme) => Container(
    width: 120,
    height: 180,
    decoration: BoxDecoration(
      color: theme.colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Icon(
      Icons.movie,
      size: 36,
      color: theme.colorScheme.onSurfaceVariant,
    ),
  );

  Widget _backdropPlaceholder(ThemeData theme) => Container(
    height: 200,
    color: theme.colorScheme.surfaceContainerHighest,
    child: const Center(child: Icon(Icons.image_not_supported_outlined)),
  );
}
