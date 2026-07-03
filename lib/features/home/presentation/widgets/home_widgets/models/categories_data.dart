import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/models/categories_model.dart';

class CategoriesData {
  static List<Categories> getStaticCategories(BuildContext context) {
    final localizations = context.l10n;
    return [
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
  }
}
