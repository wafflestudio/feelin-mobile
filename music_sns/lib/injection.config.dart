// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart' as _i5;
import 'application/auth/sign_up/email_auth_form/email_auth_form_bloc.dart'
    as _i6;
import 'domain/auth/i_auth_repository.dart' as _i3;
import 'infrastructure/auth/auth_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthRepository>(() => _i4.AuthRepository());
  gh.factory<_i5.SignInFormBloc>(
      () => _i5.SignInFormBloc(get<_i3.IAuthRepository>()));
  gh.factory<_i6.EmailAuthFormBloc>(
      () => _i6.EmailAuthFormBloc(get<_i3.IAuthRepository>()));
  return get;
}
