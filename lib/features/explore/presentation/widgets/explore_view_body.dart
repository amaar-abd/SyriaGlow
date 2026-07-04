import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/explore/presentation/manager/explore_cubit/explore_cubit.dart';
import 'package:syria_glow/features/explore/presentation/manager/explore_cubit/explore_state.dart';
import 'package:syria_glow/features/explore/presentation/widgets/search_no_results.dart';
import 'package:syria_glow/features/explore/presentation/widgets/search_results_list_view.dart';
import 'package:syria_glow/features/explore/presentation/widgets/search_text_form_field.dart';

class ExploreViewBody extends StatefulWidget {
  const ExploreViewBody({super.key});

  @override
  State<ExploreViewBody> createState() => _ExploreViewBodyState();
}

class _ExploreViewBodyState extends State<ExploreViewBody> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(reserSearch);
  }

  void reserSearch() {
    setState(() {});
    if (_searchController.text.isEmpty) {
      context.read<ExploreCubit>().resetSearch();
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(reserSearch);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(right: 14.w, left: 14.w, top: 10.h),
          sliver: SliverToBoxAdapter(
            child: SearchTextFormField(
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: const Icon(Icons.close, color: Colors.red),
                    )
                  : const SizedBox.shrink(),
              prefixIcon: IconButton(
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                    context.read<ExploreCubit>().search(
                      query: _searchController.text,
                    );
                  }
                },
                icon: Icon(Icons.search, color: AppColors.primaryGreen),
              ),
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  FocusScope.of(context).unfocus();
                  context.read<ExploreCubit>().search(query: value);
                }
              },
              hintText: 'ابحث عن اماكن, فعاليات او معارض',
              controller: _searchController,
            ),
          ),
        ),
        BlocBuilder<ExploreCubit, ExploreState>(
          builder: (context, state) {
            if (state.searchStatus == SearchStatus.loading) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.primaryGreen,
                      strokeWidth: 3,
                    ),
                  ],
                ),
              );
            }
            if (state.searchStatus == SearchStatus.success) {
              return SearchResultsListView(landmarks: state.searchResults);
            }
            if (state.searchStatus == SearchStatus.failure) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: Center(
                    child: Text(
                      state.searchErrorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              );
            }
            if (state.searchStatus == SearchStatus.noResults) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: SearchNoResults(
                  onClearSearch: () => _searchController.clear(),
                ),
              );
            }
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(color: Colors.amber, width: 100, height: 100),
              ),
            );
          },
        ),
      ],
    );
  }
}
