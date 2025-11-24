import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/auth/register/domain/usecaces/register_usecase.dart';
import 'package:hungry_app/feature/auth/register/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register() async {
    emit(RegisterLoading());
    final result = await registerUseCase(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold(
      (failure) => emit(RegisterError(error: failure.message)),
      (user) => emit(RegisterSuccess()),
    );
  }
}
