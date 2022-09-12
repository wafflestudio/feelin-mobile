// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart' as _i9;
import 'application/auth/sign_up/email_auth_form/email_auth_form_bloc.dart'
    as _i11;
import 'application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart' as _i10;
import 'application/post/post_detail_form/post_detail_form_bloc.dart' as _i12;
import 'application/post/post_form/post_form_bloc.dart' as _i6;
import 'application/profile/profile_bloc.dart' as _i13;
import 'domain/auth/i_auth_repository.dart' as _i3;
import 'infrastructure/auth/auth_repository.dart' as _i4;
import 'infrastructure/post/playlist_repository.dart' as _i5;
import 'infrastructure/post/post_repository.dart' as _i7;
import 'infrastructure/profile/profile_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthRepository>(() => _i4.AuthRepository());
  gh.lazySingleton<_i5.PlaylistRepository>(() => _i5.PlaylistRepository());
  gh.factory<_i6.PostFormBloc>(
      () => _i6.PostFormBloc(get<_i5.PlaylistRepository>()));
  gh.lazySingleton<_i7.PostRepository>(() => _i7.PostRepository());
  gh.lazySingleton<_i8.ProfileRepository>(() => _i8.ProfileRepository());
  gh.factory<_i9.SignInFormBloc>(
      () => _i9.SignInFormBloc(get<_i3.IAuthRepository>()));
  gh.factory<_i10.SignUpFormBloc>(
      () => _i10.SignUpFormBloc(get<_i3.IAuthRepository>()));
  gh.factory<_i11.EmailAuthFormBloc>(
      () => _i11.EmailAuthFormBloc(get<_i3.IAuthRepository>()));
  gh.factory<_i12.PostDetailFormBloc>(
      () => _i12.PostDetailFormBloc(get<_i7.PostRepository>()));
  gh.factory<_i13.ProfileBloc>(
      () => _i13.ProfileBloc(get<_i8.ProfileRepository>()));
  return get;
}
