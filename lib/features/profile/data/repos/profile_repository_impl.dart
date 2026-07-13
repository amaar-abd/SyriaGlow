import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/profile/data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getUserProfile();
  Future<File?> pickLocalImage(ImageSource source);
  Future<Either<Failure, String>> uploadImageToServer(File file);
}
