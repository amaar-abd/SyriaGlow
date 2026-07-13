import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syria_glow/core/errors/dio_error_handler.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:syria_glow/features/profile/data/models/profile_model.dart';
import 'package:syria_glow/features/profile/data/repos/profile_repository_impl.dart';


class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  final ProfileRemoteDataSource profileRemoteDataSource;
  final ImagePicker _picker = ImagePicker();

  @override
  Future<Either<Failure, ProfileModel>> getUserProfile() async {
    try {
      final response = await profileRemoteDataSource.getProfile();
      return right(ProfileModel.fromJson(response));
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<File?> pickLocalImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 75,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  @override
  Future<Either<Failure, String>> uploadImageToServer(File file) async {
    try {
      final response = await profileRemoteDataSource.uploadProfileImage(file);
      return right(response);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }
}
