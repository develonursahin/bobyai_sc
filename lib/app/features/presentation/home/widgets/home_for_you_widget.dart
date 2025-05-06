import 'package:boby_movie_app/app/common/cache_manager/network_image_cache_manager.dart';
import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/common/router/app_router.dart';
import 'package:boby_movie_app/app/features/presentation/home/viewmodel/home_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

class HomeForYouWidget extends StatefulWidget {
  const HomeForYouWidget({super.key});

  @override
  State<HomeForYouWidget> createState() => _HomeForYouWidgetState();
}

class _HomeForYouWidgetState extends State<HomeForYouWidget> {
  final ScrollController _scrollController = ScrollController();
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt.get<HomeViewModel>();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 20) {
      if (!_viewModel.isLoading && _viewModel.hasMorePages) {
        _viewModel.getMovieRecommendations();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Observer(
        builder: (context) {
          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount:
                _viewModel.recommendedMovies.length +
                (_viewModel.isLoading &&
                        _viewModel.hasMorePages &&
                        _viewModel.recommendedMovies.isNotEmpty
                    ? 1
                    : 0),
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              if (index == _viewModel.recommendedMovies.length) {
                return const SizedBox(
                  width: 80,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2),
                  ),
                );
              }

              final movie = _viewModel.recommendedMovies[index];
              return GestureDetector(
                onTap: () {
                  context.push('${AppPaths.movie}/${movie.id}');
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: CachedNetworkImageProvider(
                    "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                    cacheManager: NetworkImageCacheManager.custom(),
                  ),
                  backgroundColor: AppColors.white.withValues(alpha: 0.1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
