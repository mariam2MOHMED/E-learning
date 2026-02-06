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
    gh.singleton<_i5.AppLanguage>(
      () => _i5.AppLanguage(sharedPreferences: gh<_i460.SharedPreferences>()),
    );
    return this;
  }
}

class _$SharedPreferenceModule extends _i938.SharedPreferenceModule {}

class _$DioModule extends _i983.DioModule {}
