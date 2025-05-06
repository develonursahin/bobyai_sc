import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/features/presentation/search/view/search_view.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/features/presentation/search/viewmodel/search_view_model.dart';

class SearchTextField extends StatefulWidget {
  final bool isEnabled;
  final Function(String)? onChanged;
  final String? hintText;

  const SearchTextField({
    super.key,
    this.isEnabled = true,
    this.onChanged,
    this.hintText,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final viewModel = getIt.get<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSearchModal(context),
      child: TextField(
        enabled: widget.isEnabled,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grayDark,
          prefixIcon: Icon(Icons.search, color: AppColors.gray),
          suffixIcon: Observer(
            builder:
                (_) => Icon(
                  viewModel.isListening ? Icons.mic : Icons.mic_none,
                  color:
                      viewModel.isListening
                          ? AppColors.redLight
                          : AppColors.gray,
                ),
          ),
          hintText: widget.hintText ?? AppStrings.searchHint,
          hintStyle: TextStyle(color: AppColors.gray),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  void _showSearchModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const SearchView(),
    );
  }
}
