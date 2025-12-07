import 'package:absolute_cinema/data/helpers/tmdb_service.dart';
import 'package:absolute_cinema/data/models/movie_model.dart';
import 'package:absolute_cinema/widgets/logo.dart';
import 'package:absolute_cinema/widgets/movie/movie_item.dart';
import 'package:absolute_cinema/widgets/movie/movie_loader.dart';
import 'package:flutter/material.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final _service = TmdbService();
  final ScrollController _scrollController = ScrollController();

  final List<Movie> _movies = [];
  bool _isLoading = true;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _page = 1;
  static const int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _fetchPage();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_hasMore || _isLoadingMore || _isLoading) return;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _fetchPage(loadMore: true);
    }
  }

  Future<void> _fetchPage({bool loadMore = false}) async {
    if (loadMore) {
      setState(() => _isLoadingMore = true);
    } else {
      setState(() {
        _isLoading = true;
        _hasMore = true;
        _page = 1;
        _movies.clear();
      });
    }

    try {
      final results = await _service.fetchPopular(page: _page);
      setState(() {
        _movies.addAll(results);
        _hasMore = results.length >= _pageSize;
        _page++;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load absolute cinema: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SmallLogo()),
      body: _isLoading
          ? const MovieLoader()
          : RefreshIndicator(
              onRefresh: () => _fetchPage(loadMore: false),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _movies.length + (_isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < _movies.length) {
                    return MovieItem(movie: _movies[index]);
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
    );
  }
}
