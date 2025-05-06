import 'dart:math' as math;
import 'package:boby_movie_app/app/common/cache_manager/network_image_cache_manager.dart';
import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/widgets/selection_indicator_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieGenreItem extends StatefulWidget {
  final int id;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCircle;
  final String? backgroundImage;

  const MovieGenreItem({
    super.key,
    required this.id,
    required this.name,
    required this.isSelected,
    required this.onTap,
    this.isCircle = false,
    this.backgroundImage,
  });

  @override
  State<MovieGenreItem> createState() => _MovieGenreItemState();
}

class _MovieGenreItemState extends State<MovieGenreItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(MovieGenreItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _controller.forward(from: 0);
      } else {
        _controller.reverse(from: 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotationAnimation.value,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      widget.isCircle ? 100 : 12,
                    ),
                    border: Border.all(
                      color:
                          widget.isSelected
                              ? AppColors.redLight
                              : AppColors.grayLight,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      widget.isCircle ? 100 : 12,
                    ),
                    child: Stack(
                      children: [
                        if (widget.backgroundImage != null)
                          Positioned.fill(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://image.tmdb.org/t/p/w500${widget.backgroundImage}",
                              fit: BoxFit.cover,
                              cacheManager: NetworkImageCacheManager.custom(),
                              placeholder:
                                  (context, url) =>
                                      Container(color: AppColors.grayDark),
                              errorWidget:
                                  (context, url, error) =>
                                      Container(color: AppColors.grayDark),
                            ),
                          ),
                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withAlpha(
                              widget.isSelected ? 30 : 60,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: -_rotationAnimation.value,
                          child: Center(
                            child: Text(
                              widget.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (widget.isSelected)
                  const Positioned(
                    bottom: 10,
                    right: 10,
                    child: SelectionIndicator(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
