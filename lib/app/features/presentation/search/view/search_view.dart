import 'package:boby_movie_app/app/common/widgets/loader/app_circle_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/common/widgets/movie_card.dart';
import 'package:boby_movie_app/app/common/widgets/search_text_field.dart';
import 'package:boby_movie_app/app/features/presentation/search/mixin/search_mixin.dart';
import 'package:boby_movie_app/app/features/presentation/search/viewmodel/search_view_model.dart';

class SearchView extends StatelessWidget with SearchMixin {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SearchViewModel>();
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (_, controller) {
        return PopScope(
          onPopInvokedWithResult: (didPop, result) {
            viewModel.clearSearchQuery();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: BoxDecoration(
              color: AppColors.smokyBlack,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SearchTextField(
                        hintText: AppStrings.searchHint,
                        onChanged:
                            (value) =>
                                handleSearchQueryChange(value, viewModel),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => clearSearchAndPop(context, viewModel),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.grayDark,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close, color: AppColors.gray),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Observer(
                    builder: (context) {
                      if (viewModel.isLoading) {
                        return const AppCircleLoader();
                      }

                      if (viewModel.searchQuery.isEmpty) {
                        return const Center(
                          child: Text(
                            AppStrings.searchForSomething,
                            style: TextStyle(color: AppColors.gray),
                          ),
                        );
                      }

                      if (viewModel.movies.isEmpty) {
                        return const Center(
                          child: Text(
                            AppStrings.noResultsFound,
                            style: TextStyle(color: AppColors.gray),
                          ),
                        );
                      }

                      return NotificationListener<ScrollNotification>(
                        onNotification:
                            (scrollInfo) =>
                                handleScrollNotification(scrollInfo, viewModel),
                        child: AnimationLimiter(
                          child: GridView.builder(
                            controller: controller,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.7,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 12,
                                ),
                            itemCount:
                                viewModel.movies.length +
                                (viewModel.isLoadingMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index == viewModel.movies.length &&
                                  viewModel.isLoadingMore) {
                                return const AppCircleLoader();
                              }

                              final movie = viewModel.movies[index];
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                columnCount: 3,
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: MovieCard(movie: movie),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
