import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/custom_snackbar.dart';
import 'package:syria_glow/features/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:syria_glow/features/profile/data/models/profile_model.dart';
import 'package:syria_glow/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:syria_glow/features/profile/presentation/widgets/logout_button.dart';
import 'package:syria_glow/features/profile/presentation/widgets/profile_avatar_section.dart';
import 'package:syria_glow/features/profile/presentation/widgets/profile_info_card.dart';
import 'package:syria_glow/features/profile/presentation/widgets/profile_settings_card.dart';
import 'package:syria_glow/features/profile/presentation/widgets/show_logout_dialog.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFailure) {
          customSnackBar(context, state.errMessage, AppColors.error);
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryGreen,
              strokeWidth: 3,
            ),
          );
        }

        ProfileModel? profileData;
        bool isUploading = state is ProfileImageUploading;

        if (state is ProfileSuccess) {
          profileData = state.profile;
        }

        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              ProfileAvatarSection(
                isUploading: isUploading,
                imageUrl: profileData?.imageUrl ?? '',
              ),
              SizedBox(height: 10.h),
              ProfileInfoCard(
                name: profileData?.name,
                email: profileData?.email,
              ),
              SizedBox(height: 10.h),
              ProfileSettingsCard(),
              SizedBox(height: 24.h),

              LogoutButton(
                onTap: () {
                  showSignOutDialog(context, context.read<LogoutCubit>());
                },
              ),

              SizedBox(height: 40.h),
            ],
          ),
        );
      },
    );
  }
}
