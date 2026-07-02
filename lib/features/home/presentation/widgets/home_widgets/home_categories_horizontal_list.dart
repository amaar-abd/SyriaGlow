import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/models/categories_model.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/home_category_card.dart';

class HomeCategoriesHorizontalList extends StatelessWidget {
  const HomeCategoriesHorizontalList({super.key});
  @override
  Widget build(BuildContext context) {
    final localizations = context.l10n;

    final List<Categories> categories = [
      Categories(
        title: localizations.hotels,
        icon: FontAwesomeIcons.hotel,
        id: 1,
      ),
      Categories(
        title: localizations.restaurants,
        icon: FontAwesomeIcons.utensils,
        id: 2,
      ),
      Categories(
        title: localizations.historicalPlaces,
        icon: FontAwesomeIcons.landmark,
        id: 3,
      ),
      Categories(
        title: localizations.airports,
        icon: FontAwesomeIcons.planeDeparture,
        id: 4,
      ),
      Categories(
        title: localizations.nature,
        icon: FontAwesomeIcons.mountain,
        id: 5,
      ),
      Categories(
        title: localizations.religious,
        icon: FontAwesomeIcons.mosque,
        id: 6,
      ),
    ];

    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 24.w),
            child: HomeCategoryItem(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.categoryView,
                  arguments: {
                    'id': categories[index].id,
                    'title': categories[index].title,
                  },
                );
              },
              title: categories[index].title,
              icon: categories[index].icon,
            ),
          );
        },
      ),
    );
  }
}
