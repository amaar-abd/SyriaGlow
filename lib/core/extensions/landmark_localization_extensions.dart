import 'package:flutter/material.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';


extension LandmarkLocalization on Landmark {

  String _currentLang(BuildContext context) {
    return Localizations.localeOf(context).languageCode;
  }


  String name(BuildContext context) {
    return _currentLang(context) == 'ar' ? nameAr : nameEn;
  }


  String description(BuildContext context) {
    return _currentLang(context) == 'ar' ? descAr : descEn;
  }


  String addr(BuildContext context) {
    return _currentLang(context) == 'ar' ? address : addressEn;
  }
}


extension CategoryLocalization on Category {
  
  String name(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'ar' ? nameAr : nameEn;
  }
}