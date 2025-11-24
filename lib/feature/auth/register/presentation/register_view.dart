import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/networking/api/dio_consumer.dart';
import 'package:hungry_app/feature/auth/register/data/datasources/register_remote_data_source.dart';
import 'package:hungry_app/feature/auth/register/data/repos/register_repository_impl.dart';
import 'package:hungry_app/feature/auth/register/domain/usecaces/register_usecase.dart';
import 'package:hungry_app/feature/auth/register/presentation/cubit/register_cubit.dart';
import 'package:hungry_app/feature/auth/register/presentation/widget/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => RegisterCubit(
            RegisterUseCase(
              registerRepo: RegisterRepositoryImpl(
                remoteDataSource: RegisterRemoteDataSourceImpl(
                  api: DioConsumer(Dio()),
                ),
              ),
            ),
          ),
          child: RegisterViewBody(),
        ),
      ),
    );
  }
}
