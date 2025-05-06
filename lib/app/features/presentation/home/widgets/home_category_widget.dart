import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/features/presentation/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final viewModel = getIt.get<HomeViewModel>();
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 12,
            children:
                viewModel.categories.map((category) {
                  final isSelected = category == viewModel.selectedCategory;
                  return FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    label: Text(category.name ?? "NaN"),
                    selected: isSelected,
                    onSelected: (_) {
                      viewModel.setSelectedCategory(category);
                      viewModel.getMoviesByGenre();
                    },
                    selectedColor: AppColors.redLight,
                    backgroundColor: AppColors.grayDark,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    checkmarkColor: AppColors.white,
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}
