part of 'profile_cubit.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profile;
  ProfileSuccess({required this.profile});
}
class ProfileFailure extends ProfileState {
  final String errMessage;
  ProfileFailure({required this.errMessage});
}


class ProfileImageUploading extends ProfileState {}