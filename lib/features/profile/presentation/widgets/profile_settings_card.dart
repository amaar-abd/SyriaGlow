import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/manager/localization_cubit/language_cubit.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_cubit.dart';
import 'package:syria_glow/features/profile/presentation/widgets/profile_settings_item.dart';

class ProfileSettingsCard extends StatefulWidget {
  const ProfileSettingsCard({super.key});

  @override
  State<ProfileSettingsCard> createState() => _ProfileSettingsCardState();
}

class _ProfileSettingsCardState extends State<ProfileSettingsCard> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'ar';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.textDark.withAlpha(15),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          children: [
            SettingsItem(
              icon: Icons.favorite,
              title: context.l10n.favorite,
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.favoriteView);
              },
            ),
            const Divider(color: AppColors.backgroundLight, thickness: 1.2),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
              leading:
                 
                   Icon(
                    Icons.notifications,
                    size: 25.r,
                    color: AppColors.elegantGold,
                  ),
              
              title: Text(
                context.l10n.notifications,
                style: TextTheme.of(context).bodyLarge?.copyWith(
                  color: AppColors.textDark,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Switch(
                value: _notificationsEnabled,
                activeThumbColor: AppColors.elegantGold,
                activeTrackColor: AppColors.primaryGreen,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            const Divider(color: AppColors.backgroundLight, thickness: 1.2),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
              leading:   Icon(
                    Icons.language,
                    color: AppColors.elegantGold,
                    size: 25.r,
                  ),
               
              title: Text(
                context.l10n.change_language,
                style: TextTheme.of(context).bodyLarge?.copyWith(
                  color: AppColors.textDark,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: AppColors.surfaceWhite,
                  value: _selectedLanguage,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.elegantGold,
                  ),
                  onChanged: (newValue) async {
                    if (newValue != null && newValue != _selectedLanguage) {
                      context.read<LanguageCubit>().toggleLanguage();
                      await Future.delayed(Duration.zero);

                      if (context.mounted) {
                        context.read<UserLocationCubit>().fetchLocation(
                          languageCode: newValue,
                        );
                      }
                      setState(() {
                        _selectedLanguage = newValue;
                      });
                    }
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text(
                        context.l10n.arabic,
                        style: TextTheme.of(context).bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGray,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(
                        context.l10n.english,
                        style: TextTheme.of(context).bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGray,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: AppColors.backgroundLight, thickness: 1.2),

            SettingsItem(
              icon: Icons.info_outline,
              title: context.l10n.about_us,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
