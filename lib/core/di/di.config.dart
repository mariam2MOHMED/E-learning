// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../feature/auth/api/client/auth_api_services.dart' as _i199;
import '../../feature/auth/api/data_source/auth_data_source_impl.dart' as _i596;
import '../../feature/auth/data/data_source/auth_data_source.dart' as _i868;
import '../../feature/auth/data/repositry/auth_repo_impl.dart' as _i1069;
import '../../feature/auth/domain/repositry/auth_repo.dart' as _i569;
import '../../feature/auth/domain/use_case/forget_password_use_case.dart'
    as _i748;
import '../../feature/auth/domain/use_case/login_use_case.dart' as _i433;
import '../../feature/auth/domain/use_case/register_use_case.dart' as _i313;
import '../../feature/auth/domain/use_case/reset_password_use_case.dart'
    as _i84;
import '../../feature/auth/domain/use_case/verify_code.dart' as _i585;
import '../../feature/auth/presentation/view_model/forget_password/forget_password_cubit.dart'
    as _i173;
import '../../feature/auth/presentation/view_model/login/login_cubit.dart'
    as _i21;
import '../../feature/auth/presentation/view_model/register/register_cubit.dart'
    as _i987;
import '../app_language/app_language.dart' as _i5;
import 'modules/dio_module.dart' as _i983;
import 'modules/shared_preference.dart' as _i938;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferenceModule = _$SharedPreferenceModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferenceModule.provideSharedPreferenceMoudle(),
      preResolve: true,
    );
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioModule.prettyDioLogger);
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i199.AuthApiServices>(
      () => _i199.AuthApiServices(gh<_i361.Dio>()),
    );
    gh.singleton<_i5.AppLanguage>(
      () => _i5.AppLanguage(sharedPreferences: gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i868.AuthDataSource>(
      () => _i596.AuthDataSourceImpl(gh<_i199.AuthApiServices>()),
    );
    gh.factory<_i569.AuthRepo>(
      () => _i1069.AuthRepoImpl(gh<_i868.AuthDataSource>()),
    );
    gh.factory<_i748.ForgetPasswordUseCase>(
      () => _i748.ForgetPasswordUseCase(gh<_i569.AuthRepo>()),
    );
    gh.factory<_i433.LoginUseCase>(
      () => _i433.LoginUseCase(gh<_i569.AuthRepo>()),
    );
    gh.factory<_i313.RegisterUseCase>(
      () => _i313.RegisterUseCase(gh<_i569.AuthRepo>()),
    );
    gh.factory<_i84.ResetPasswordUseCase>(
      () => _i84.ResetPasswordUseCase(gh<_i569.AuthRepo>()),
    );
    gh.factory<_i585.VerifyCodeUseCase>(
      () => _i585.VerifyCodeUseCase(gh<_i569.AuthRepo>()),
    );
    gh.factory<_i987.RegisterCubit>(
      () => _i987.RegisterCubit(gh<_i313.RegisterUseCase>()),
    );
    gh.factory<_i173.ForgetPasswordCubit>(
      () => _i173.ForgetPasswordCubit(
        gh<_i748.ForgetPasswordUseCase>(),
        gh<_i585.VerifyCodeUseCase>(),
        gh<_i84.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i21.LoginCubit>(
      () => _i21.LoginCubit(gh<_i433.LoginUseCase>()),
    );
    return this;
  }
}

class _$SharedPreferenceModule extends _i938.SharedPreferenceModule {}

class _$DioModule extends _i983.DioModule {}
