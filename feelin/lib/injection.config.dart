// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth/auth_bloc.dart' as _i15;
import 'application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart' as _i12;
import 'application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart' as _i13;
import 'application/edit/edit_post_form/edit_post_form_bloc.dart' as _i17;
import 'application/edit/edit_profile_form/edit_profile_form_bloc.dart' as _i18;
import 'application/explore/explore_bloc.dart' as _i19;
import 'application/follow/follow_bloc.dart' as _i20;
import 'application/info/playlist_info_bloc.dart' as _i8;
import 'application/post/post_detail_form/post_detail_form_bloc.dart' as _i21;
import 'application/post/post_form/post_form_bloc.dart' as _i22;
import 'application/profile/profile_bloc.dart' as _i23;
import 'application/streaming/connect_streaming_bloc.dart' as _i16;
import 'domain/auth/i_auth_repository.dart' as _i6;
import 'infrastructure/auth/auth_repository.dart' as _i7;
import 'infrastructure/explore/explore_post_repository.dart' as _i3;
import 'infrastructure/explore/explore_repository.dart' as _i4;
import 'infrastructure/follow/follow_repository.dart' as _i5;
import 'infrastructure/post/playlist_repository.dart' as _i9;
import 'infrastructure/post/post_repository.dart' as _i10;
import 'infrastructure/profile/profile_repository.dart' as _i11;
import 'infrastructure/streaming/streaming_repository.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ExplorePostRepository>(
      () => _i3.ExplorePostRepository());
  gh.lazySingleton<_i4.ExploreRepository>(() => _i4.ExploreRepository());
  gh.lazySingleton<_i5.FollowRepository>(() => _i5.FollowRepository());
  gh.lazySingleton<_i6.IAuthRepository>(() => _i7.AuthRepository());
  gh.factory<_i8.PlaylistInfoBloc>(
      () => _i8.PlaylistInfoBloc(get<_i3.ExplorePostRepository>()));
  gh.lazySingleton<_i9.PlaylistRepository>(() => _i9.PlaylistRepository());
  gh.lazySingleton<_i10.PostRepository>(() => _i10.PostRepository());
  gh.lazySingleton<_i11.ProfileRepository>(() => _i11.ProfileRepository());
  gh.factory<_i12.SignInFormBloc>(
      () => _i12.SignInFormBloc(get<_i6.IAuthRepository>()));
  gh.factory<_i13.SignUpFormBloc>(
      () => _i13.SignUpFormBloc(get<_i6.IAuthRepository>()));
  gh.lazySingleton<_i14.StreamingRepository>(() => _i14.StreamingRepository());
  gh.factory<_i15.AuthBloc>(() => _i15.AuthBloc(get<_i6.IAuthRepository>()));
  gh.factory<_i16.ConnectStreamingBloc>(
      () => _i16.ConnectStreamingBloc(get<_i14.StreamingRepository>()));
  gh.factory<_i17.EditPostFormBloc>(
      () => _i17.EditPostFormBloc(get<_i10.PostRepository>()));
  gh.factory<_i18.EditProfileFormBloc>(
      () => _i18.EditProfileFormBloc(get<_i11.ProfileRepository>()));
  gh.factory<_i19.ExploreBloc>(
      () => _i19.ExploreBloc(get<_i4.ExploreRepository>()));
  gh.factory<_i20.FollowBloc>(
      () => _i20.FollowBloc(get<_i5.FollowRepository>()));
  gh.factory<_i21.PostDetailFormBloc>(
      () => _i21.PostDetailFormBloc(get<_i10.PostRepository>()));
  gh.factory<_i22.PostFormBloc>(() => _i22.PostFormBloc(
      get<_i9.PlaylistRepository>(), get<_i10.PostRepository>()));
  gh.factory<_i23.ProfileBloc>(
      () => _i23.ProfileBloc(get<_i11.ProfileRepository>()));
  return get;
}
