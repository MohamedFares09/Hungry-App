import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:hungry_app/feature/profile/domain/usecases/update_user_profile_usecase.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfileUseCase getUserProfileUseCase;
  final UpdateUserProfileUseCase updateUserProfileUseCase;

  ProfileCubit(this.getUserProfileUseCase, this.updateUserProfileUseCase)
    : super(ProfileInitial());

  Future<void> getUserProfile() async {
    emit(ProfileLoading());

    final result = await getUserProfileUseCase.call();

    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (user) => emit(ProfileSuccess(user: user)),
    );
  }

  Future<void> updateUserProfile({
    required String name,
    required String email,
    String? imagePath,
  }) async {
    emit(ProfileUpdating());

    final result = await updateUserProfileUseCase.call(
      name: name,
      email: email,
      imagePath: imagePath,
    );

    result.fold(
      (failure) => emit(ProfileUpdateError(message: failure.message)),
      (user) => emit(ProfileUpdateSuccess(user: user)),
    );
  }
}
