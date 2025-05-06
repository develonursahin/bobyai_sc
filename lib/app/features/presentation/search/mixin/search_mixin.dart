import 'package:flutter/material.dart';
import 'package:boby_movie_app/app/features/presentation/search/viewmodel/search_view_model.dart';

mixin SearchMixin {
  void initializeSearch(SearchViewModel viewModel, String? initialQuery) {
    if (initialQuery != null && initialQuery.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.setSearchQuery(initialQuery);
        viewModel.searchMovies();
      });
    }
  }

  void handleSearchQueryChange(String value, SearchViewModel viewModel) {
    viewModel.setSearchQuery(value);
    Future.delayed(const Duration(milliseconds: 500), () {
      if (value == viewModel.searchQuery && value.isNotEmpty) {
        viewModel.searchMovies();
      }
    });
  }

  void clearSearchAndPop(BuildContext context, SearchViewModel viewModel) {
    viewModel.clearSearchQuery();
    Navigator.pop(context);
  }

  bool handleScrollNotification(
    ScrollNotification scrollInfo,
    SearchViewModel viewModel,
  ) {
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      if (viewModel.hasMorePages && !viewModel.isLoadingMore) {
        viewModel.loadMoreMovies();
      }
      return true;
    }
    return false;
  }
}
