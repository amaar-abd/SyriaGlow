import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syria_glow/features/profile/data/models/profile_model.dart';
import 'package:syria_glow/features/profile/data/repos/profile_repository_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repository) : super(ProfileInitial());
  final ProfileRepository repository;

  Future<void> fetchProfile() async {
    emit(ProfileLoading());

    final profile = await repository.getUserProfile();
    profile.fold(
      (failure) => emit(ProfileFailure(errMessage: failure.message)),
      (profileData) => emit(ProfileSuccess(profile: profileData)),
    );
  }

  Future<void> pickAndUploadImage(ImageSource source) async {
    try {
      final file = await repository.pickLocalImage(source);
      if (file != null) {
        emit(ProfileImageUploading());

        await repository.uploadImageToServer(file);

        await fetchProfile();
      }
    } catch (e) {
      emit(ProfileFailure(errMessage: e.toString()));
    }
  }
}
