import 'dart:io';
import 'package:dio/dio.dart';
import 'package:syria_glow/core/Constants/app_constatntes.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/networking/api_constants.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/core/services/secure_storage_service.dart';

abstract class ProfileRemoteDataSource {
  Future<Map<String,dynamic>> getProfile();
  Future<String> uploadProfileImage(File imageFile);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl({required this.apiService});
  final ApiService apiService;

  @override
  Future<Map<String,dynamic>> getProfile() async {
    try {
      final String? token = await sl<SecureStorageService>().read(AppConstants.authToken);
      final response = await apiService.get(ApiConstants.showProfile,headers: {
          'Authorization': 'Bearer $token', 
        },);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> uploadProfileImage(File imageFile) async {
    try {
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image_profile": await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });
        final String? token = await sl<SecureStorageService>().read(AppConstants.authToken);
      final response = await apiService.post(
        ApiConstants.updateProfileome,
        body:  formData,
        headers: {
          'Authorization': 'Bearer $token', 
        },

      );
      return response['message'];
    } catch (e) {
      rethrow;
    }
  }
}
