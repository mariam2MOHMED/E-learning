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
import '../../feature/explore/api/client/explore_services.dart' as _i84;
import '../../feature/explore/api/data_source/explore_data_source_impl.dart'
    as _i1071;
import '../../feature/explore/data/data_source/explore_data_source.dart'
    as _i184;
import '../../feature/explore/data/repo/explore_repo_impl.dart' as _i495;
import '../../feature/explore/domain/repo/explore_repo.dart' as _i183;
import '../../feature/explore/domain/use_case/get_all_exams_use_case.dart'
    as _i2;
import '../../feature/explore/domain/use_case/get_all_subjects_use_case.dart'
    as _i212;
import '../../feature/explore/domain/use_case/get_exam_by_subject_use_case.dart'
    as _i952;
import '../../feature/explore/presentation/view_model/explore_cubit/explore_cubit.dart'
    as _i1059;
import '../../feature/profile/api/client/profile_client.dart' as _i324;
import '../../feature/profile/api/data/profile_data_source_impl.dart' as _i1047;
import '../../feature/profile/data/data/profile_data_source.dart' as _i679;
import '../../feature/profile/data/repo/profile_repo_impl.dart' as _i341;
import '../../feature/profile/domain/repo/profile_repo.dart' as _i53;
import '../../feature/profile/domain/use_case/change_password_use_case.dart'
    as _i1053;
import '../../feature/profile/domain/use_case/edit_profile_use_case.dart'
    as _i36;
import '../../feature/profile/domain/use_case/get_logged_user_profile_use_case.dart'
    as _i527;
import '../../feature/profile/presentation/view_model/change_password/change_password_cubit.dart'
    as _i371;
import '../../feature/profile/presentation/view_model/profile/profile_cubit.dart'
    as _i317;
import '../app_language/app_language.dart' as _i5;
import '../cache/cache_helper.dart' as _i144;
import '../cache/secure_storage_helper.dart' as _i342;
import '../interceptor/token_interceptor.dart' as _i827;
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
    gh.singleton<_i144.SharedPreferencesHelper>(
      () => _i144.SharedPreferencesHelper(),
    );
    gh.singleton<_i342.SecureStorage>(() => _i342.SecureStorage());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioModule.prettyDioLogger);
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i199.AuthApiServices>(
      () => _i199.AuthApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i84.ExploreServices>(
      () => _i84.ExploreServices(gh<_i361.Dio>()),
    );
    gh.factory<_i324.ProfileApiServices>(
      () => _i324.ProfileApiServices(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i827.TokenInterceptor>(
      () => _i827.TokenInterceptor(gh<_i342.SecureStorage>()),
    );
    gh.singleton<_i5.AppLanguage>(
      () => _i5.AppLanguage(sharedPreferences: gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i184.ExploreDataSource>(
      () => _i1071.ExploreDataSourceImpl(gh<_i84.ExploreServices>()),
    );
    gh.factory<_i868.AuthDataSource>(
      () => _i596.AuthDataSourceImpl(gh<_i199.AuthApiServices>()),
    );
    gh.factory<_i679.ProfileDataSource>(
      () => _i1047.ProfileDataSourceImpl(gh<_i324.ProfileApiServices>()),
    );
    gh.factory<_i53.ProfileRepo>(
      () => _i341.ProfileRepoImpl(gh<_i679.ProfileDataSource>()),
    );
    gh.factory<_i183.ExploreRepo>(
      () => _i495.ExploreRepoImpl(gh<_i184.ExploreDataSource>()),
    );
    gh.factory<_i1053.ChangePasswordUseCase>(
      () => _i1053.ChangePasswordUseCase(gh<_i53.ProfileRepo>()),
    );
    gh.factory<_i36.EditProfileUseCase>(
      () => _i36.EditProfileUseCase(gh<_i53.ProfileRepo>()),
    );
    gh.factory<_i527.GetLoggedUserProfileUseCase>(
      () => _i527.GetLoggedUserProfileUseCase(gh<_i53.ProfileRepo>()),
    );
    gh.factory<_i2.GetAllExamsUseCase>(
      () => _i2.GetAllExamsUseCase(gh<_i183.ExploreRepo>()),
    );
    gh.factory<_i212.GetAllSubjectsUseCase>(
      () => _i212.GetAllSubjectsUseCase(gh<_i183.ExploreRepo>()),
    );
    gh.factory<_i952.GetExamBySubjectUseCase>(
      () => _i952.GetExamBySubjectUseCase(gh<_i183.ExploreRepo>()),
    );
    gh.factory<_i569.AuthRepo>(
      () => _i1069.AuthRepoImpl(gh<_i868.AuthDataSource>()),
    );
    gh.factory<_i317.ProfileCubit>(
      () => _i317.ProfileCubit(
        gh<_i527.GetLoggedUserProfileUseCase>(),
        gh<_i36.EditProfileUseCase>(),
      ),
    );
    gh.factory<_i1059.ExploreCubit>(
      () => _i1059.ExploreCubit(
        gh<_i212.GetAllSubjectsUseCase>(),
        gh<_i952.GetExamBySubjectUseCase>(),
        gh<_i2.GetAllExamsUseCase>(),
      ),
    );
    gh.factory<_i371.ChangePasswordCubit>(
      () => _i371.ChangePasswordCubit(gh<_i1053.ChangePasswordUseCase>()),
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
      () => _i21.LoginCubit(
        gh<_i433.LoginUseCase>(),
        gh<_i342.SecureStorage>(),
        gh<_i144.SharedPreferencesHelper>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferenceModule extends _i938.SharedPreferenceModule {}

class _$DioModule extends _i983.DioModule {}
