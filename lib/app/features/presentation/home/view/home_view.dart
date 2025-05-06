import 'package:boby_movie_app/app/features/presentation/home/widgets/home_category_result_widget.dart';
import 'package:boby_movie_app/app/features/presentation/home/widgets/home_for_you_widget.dart';
import 'package:boby_movie_app/app/common/widgets/search_text_field.dart';
import 'package:boby_movie_app/app/features/presentation/home/widgets/pro_badge_widget.dart';
import 'package:boby_movie_app/core/extensions/widgets/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/features/presentation/home/viewmodel/home_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/home/widgets/home_category_widget.dart';
import 'package:boby_movie_app/app/features/presentation/home/widgets/title_with_icon_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) {
                  final viewModel = getIt.get<HomeViewModel>();
                  return Row(
                    children: [
                      const TitleWithIcon(
                        title: AppStrings.forYou,
                        icon: Icons.star,
                        iconColor: Colors.amber,
                      ),
                      const Spacer(),
                      ProBadgeWidget(isVisible: viewModel.isPro),
                    ],
                  );
                },
              ),
              const HomeForYouWidget(),
              Divider(),
              const TitleWithIcon(title: AppStrings.movies, icon: Icons.movie),
              const SearchTextField(
                isEnabled: false,
              ).symmetricPadding(horizontal: 24),
              const HomeCategoryWidget(),
              Observer(
                builder: (_) {
                  final viewModel = getIt.get<HomeViewModel>();
                  return Text(
                    viewModel.selectedCategory.name ?? "NaN",
                    key: ValueKey(viewModel.selectedCategory.name),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ).symmetricPadding(horizontal: 24),
              const HomeCategoryResultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
