import 'dart:developer';

import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/router/app_router.dart';
import 'package:boby_movie_app/app/features/data/models/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CupertinoContextMenu(
            actions: [
              CupertinoContextMenuAction(
                onPressed: () {
                  log('CupertinoContextMenu tapped: ${movie.id}');
                  Navigator.pop(context);
                },
                trailingIcon: CupertinoIcons.heart,
                child: const Text('Add to favorites'),
              ),
              CupertinoContextMenuAction(
                onPressed: () {
                  log('CupertinoContextMenu tapped: ${movie.id}');
                  Navigator.pop(context);
                },
                trailingIcon: CupertinoIcons.info,
                child: const Text('Show details'),
              ),
            ],
            child: GestureDetector(
              onTap: () {
                log('MovieCard tapped: ${movie.id}');
                if (movie.id != null) {
                  context.push('${AppPaths.movie}/${movie.id}');
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:
                      movie.posterPath?.isEmpty ?? true
                          ? Container(
                            color: AppColors.white.withValues(alpha: 0.1),
                            child: const Center(
                              child: Icon(Icons.movie_outlined, color: AppColors.white, size: 32),
                            ),
                          )
                          : CachedNetworkImage(
                            imageUrl: "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                            fit: BoxFit.cover,
                            placeholder:
                                (context, url) => Container(
                                  color: AppColors.white.withValues(alpha: 0.1),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.white,
                                    ),
                                  ),
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
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          movie.title ?? "",
          style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 12),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
