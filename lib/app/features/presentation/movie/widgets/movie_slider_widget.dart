import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/common/widgets/loader/app_circle_loader.dart';
import 'package:boby_movie_app/app/features/presentation/movie/viewmodel/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieSliderWidget extends StatelessWidget {
  const MovieSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final viewModel = getIt.get<MovieViewModel>();
        if (viewModel.isLoadingImages) {
          return const AppCircleLoader();
        }
        return CarouselSlider(
          options: CarouselOptions(
            height: 300,
            viewportFraction: 0.85,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
          ),
          items:
              viewModel.movieImages.map((imagePath) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withAlpha(76),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original$imagePath',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: AppColors.white.withAlpha(25),
                          child: const AppCircleLoader(),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}
