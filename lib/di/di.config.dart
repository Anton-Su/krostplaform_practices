// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:practice_1/data/database.dart' as _i623;
import 'package:practice_1/pages/myHomePage/block/detail_bloc.dart' as _i450;
import 'package:practice_1/pages/myHomePage/block/my_home_bloc.dart' as _i289;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i623.AppDatabase>(() => _i623.AppDatabase());
    gh.factory<_i450.DetailBloc>(
      () => _i450.DetailBloc(gh<_i623.AppDatabase>()),
    );
    gh.factory<_i289.MyHomeBloc>(
      () => _i289.MyHomeBloc(gh<_i623.AppDatabase>()),
    );
    return this;
  }
}
