import 'package:boby_movie_app/app/common/cache_manager/network_image_cache_manager.dart';
import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/widgets/loader/app_circle_loader.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/widgets/selection_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MoviePosterBox extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;
  final double size;
  final VoidCallback onTap;

  const MoviePosterBox({
    super.key,
    required this.imageUrl,
    required this.isSelected,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.redLight : Colors.transparent,
                width: 3,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: "https://image.tmdb.org/t/p/w500/$imageUrl",
                      fit: BoxFit.cover,
                      cacheManager: NetworkImageCacheManager.custom(),
                      placeholder:
                          (context, url) => Container(
                            color: AppColors.white.withValues(alpha: 0.1),
                            child: const AppCircleLoader(),
                          ),
                      errorWidget:
                          (context, url, error) => Container(
                            color: AppColors.white.withValues(alpha: 0.1),
                            child: const Center(
                              child: Icon(
                                Icons.movie_outlined,
                                color: AppColors.white,
                                size: 32,
                              ),
                            ),
                          ),
                    ),
                  ),
                  if (isSelected)
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.redLight.withAlpha(102),
                              Colors.transparent,
                              Colors.transparent,
                              AppColors.redLight.withAlpha(102),
                            ],
                            stops: [0.0, 0.3, 0.7, 1.0],
                          ),
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                AppColors.redLight.withAlpha(102),
                                Colors.transparent,
                                Colors.transparent,
                                AppColors.redLight.withAlpha(102),
                              ],
                              stops: [0.0, 0.3, 0.7, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (isSelected)
            const Positioned(bottom: 8, right: 8, child: SelectionIndicator()),
        ],
      ),
    );
  }
}
