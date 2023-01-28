// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:music_sns/application/auth/auth/auth_bloc.dart' as _i14;
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart'
    as _i11;
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart'
    as _i12;
import 'package:music_sns/application/edit/edit_post_form/edit_post_form_bloc.dart'
    as _i16;
import 'package:music_sns/application/edit/edit_profile_form/edit_profile_form_bloc.dart'
    as _i17;
import 'package:music_sns/application/explore/explore_bloc.dart' as _i18;
import 'package:music_sns/application/follow/follow_bloc.dart' as _i19;
import 'package:music_sns/application/info/playlist_info_bloc.dart' as _i7;
import 'package:music_sns/application/post/post_form/post_form_bloc.dart'
    as _i20;
import 'package:music_sns/application/profile/profile_bloc.dart' as _i21;
import 'package:music_sns/application/streaming/connect/connect_streaming_bloc.dart'
    as _i15;
import 'package:music_sns/application/streaming/streaming_bloc.dart' as _i22;
import 'package:music_sns/infrastructure/auth/auth_repository.dart' as _i3;
import 'package:music_sns/infrastructure/explore/explore_post_repository.dart'
    as _i4;
import 'package:music_sns/infrastructure/explore/explore_repository.dart'
    as _i5;
import 'package:music_sns/infrastructure/follow/follow_repository.dart' as _i6;
import 'package:music_sns/infrastructure/post/playlist_repository.dart' as _i8;
import 'package:music_sns/infrastructure/post/post_repository.dart' as _i9;
import 'package:music_sns/infrastructure/profile/profile_repository.dart'
    as _i10;
import 'package:music_sns/infrastructure/streaming/streaming_repository.dart'
    as _i13;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthRepository>(() => _i3.AuthRepository());
    gh.lazySingleton<_i4.ExplorePostRepository>(
        () => _i4.ExplorePostRepository());
    gh.lazySingleton<_i5.ExploreRepository>(() => _i5.ExploreRepository());
    gh.lazySingleton<_i6.FollowRepository>(() => _i6.FollowRepository());
    gh.factory<_i7.PlaylistInfoBloc>(
        () => _i7.PlaylistInfoBloc(gh<_i4.ExplorePostRepository>()));
    gh.lazySingleton<_i8.PlaylistRepository>(() => _i8.PlaylistRepository());
    gh.lazySingleton<_i9.PostRepository>(() => _i9.PostRepository());
    gh.lazySingleton<_i10.ProfileRepository>(() => _i10.ProfileRepository());
    gh.factory<_i11.SignInFormBloc>(
        () => _i11.SignInFormBloc(gh<_i3.AuthRepository>()));
    gh.factory<_i12.SignUpFormBloc>(
        () => _i12.SignUpFormBloc(gh<_i3.AuthRepository>()));
    gh.lazySingleton<_i13.StreamingRepository>(
        () => _i13.StreamingRepository());
    gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(gh<_i3.AuthRepository>()));
    gh.factory<_i15.ConnectStreamingBloc>(
        () => _i15.ConnectStreamingBloc(gh<_i13.StreamingRepository>()));
    gh.factory<_i16.EditPostFormBloc>(
        () => _i16.EditPostFormBloc(gh<_i9.PostRepository>()));
    gh.factory<_i17.EditProfileFormBloc>(
        () => _i17.EditProfileFormBloc(gh<_i10.ProfileRepository>()));
    gh.factory<_i18.ExploreBloc>(
        () => _i18.ExploreBloc(gh<_i5.ExploreRepository>()));
    gh.factory<_i19.FollowBloc>(
        () => _i19.FollowBloc(gh<_i6.FollowRepository>()));
    gh.factory<_i20.PostFormBloc>(() => _i20.PostFormBloc(
          gh<_i8.PlaylistRepository>(),
          gh<_i9.PostRepository>(),
        ));
    gh.factory<_i21.ProfileBloc>(
        () => _i21.ProfileBloc(gh<_i10.ProfileRepository>()));
    gh.factory<_i22.StreamingBloc>(
        () => _i22.StreamingBloc(gh<_i13.StreamingRepository>()));
    return this;
  }
}
