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
import 'package:practice_1/domain/repository/position_repository.dart' as _i876;
import 'package:practice_1/domain/repository/position_repository_impl.dart'
    as _i86;
import 'package:practice_1/domain/usecases/get_position_by_id.dart' as _i167;
import 'package:practice_1/domain/usecases/get_positions.dart' as _i763;
import 'package:practice_1/pages/myHomePage/bloc/detail/detail_bloc.dart'
    as _i266;
import 'package:practice_1/pages/myHomePage/bloc/my_home/my_home_bloc.dart'
    as _i926;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i623.AppDatabase>(() => _i623.AppDatabase());
    gh.lazySingleton<_i876.PositionRepository>(
      () => _i86.PositionRepositoryImpl(gh<_i623.AppDatabase>()),
    );
    gh.factory<_i167.GetPositionById>(
      () => _i167.GetPositionById(gh<_i876.PositionRepository>()),
    );
    gh.factory<_i763.GetPositions>(
      () => _i763.GetPositions(gh<_i876.PositionRepository>()),
    );
    gh.factory<_i926.MyHomeBloc>(
      () => _i926.MyHomeBloc(gh<_i763.GetPositions>()),
    );
    gh.factory<_i266.DetailBloc>(
      () => _i266.DetailBloc(gh<_i167.GetPositionById>()),
    );
    return this;
  }
}
