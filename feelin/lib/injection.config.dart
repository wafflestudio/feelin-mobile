// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:music_sns/application/auth/auth/auth_bloc.dart' as _i16;
import 'package:music_sns/application/auth/sign_in/sign_in_form/sign_in_form_bloc.dart'
    as _i13;
import 'package:music_sns/application/auth/sign_up/sign_up_form/sign_up_form_bloc.dart'
    as _i14;
import 'package:music_sns/application/block/blocked_user_bloc.dart' as _i5;
import 'package:music_sns/application/edit/edit_post_form/edit_post_form_bloc.dart'
    as _i18;
import 'package:music_sns/application/edit/edit_profile_form/edit_profile_form_bloc.dart'
    as _i19;
import 'package:music_sns/application/explore/explore_bloc.dart' as _i20;
import 'package:music_sns/application/follow/follow_bloc.dart' as _i21;
import 'package:music_sns/application/info/playlist_info_bloc.dart' as _i9;
import 'package:music_sns/application/post/post_form/post_form_bloc.dart'
    as _i22;
import 'package:music_sns/application/profile/profile_bloc.dart' as _i23;
import 'package:music_sns/application/streaming/connect/connect_streaming_bloc.dart'
    as _i17;
import 'package:music_sns/application/streaming/streaming_bloc.dart' as _i24;
import 'package:music_sns/infrastructure/auth/auth_repository.dart' as _i3;
import 'package:music_sns/infrastructure/block/block_repository.dart' as _i4;
import 'package:music_sns/infrastructure/explore/explore_post_repository.dart'
    as _i6;
import 'package:music_sns/infrastructure/explore/explore_repository.dart'
    as _i7;
import 'package:music_sns/infrastructure/follow/follow_repository.dart' as _i8;
import 'package:music_sns/infrastructure/post/playlist_repository.dart' as _i10;
import 'package:music_sns/infrastructure/post/post_repository.dart' as _i11;
import 'package:music_sns/infrastructure/profile/profile_repository.dart'
    as _i12;
import 'package:music_sns/infrastructure/streaming/streaming_repository.dart'
    as _i15;

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
    gh.lazySingleton<_i4.BlockRepository>(() => _i4.BlockRepository());
    gh.factory<_i5.BlockedUserBloc>(
        () => _i5.BlockedUserBloc(gh<_i4.BlockRepository>()));
    gh.lazySingleton<_i6.ExplorePostRepository>(
        () => _i6.ExplorePostRepository());
    gh.lazySingleton<_i7.ExploreRepository>(() => _i7.ExploreRepository());
    gh.lazySingleton<_i8.FollowRepository>(() => _i8.FollowRepository());
    gh.factory<_i9.PlaylistInfoBloc>(() => _i9.PlaylistInfoBloc(
          gh<_i6.ExplorePostRepository>(),
          gh<_i4.BlockRepository>(),
        ));
    gh.lazySingleton<_i10.PlaylistRepository>(() => _i10.PlaylistRepository());
    gh.lazySingleton<_i11.PostRepository>(() => _i11.PostRepository());
    gh.lazySingleton<_i12.ProfileRepository>(() => _i12.ProfileRepository());
    gh.factory<_i13.SignInFormBloc>(
        () => _i13.SignInFormBloc(gh<_i3.AuthRepository>()));
    gh.factory<_i14.SignUpFormBloc>(
        () => _i14.SignUpFormBloc(gh<_i3.AuthRepository>()));
    gh.lazySingleton<_i15.StreamingRepository>(
        () => _i15.StreamingRepository());
    gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(gh<_i3.AuthRepository>()));
    gh.factory<_i17.ConnectStreamingBloc>(
        () => _i17.ConnectStreamingBloc(gh<_i15.StreamingRepository>()));
    gh.factory<_i18.EditPostFormBloc>(
        () => _i18.EditPostFormBloc(gh<_i11.PostRepository>()));
    gh.factory<_i19.EditProfileFormBloc>(
        () => _i19.EditProfileFormBloc(gh<_i12.ProfileRepository>()));
    gh.factory<_i20.ExploreBloc>(
        () => _i20.ExploreBloc(gh<_i7.ExploreRepository>()));
    gh.factory<_i21.FollowBloc>(
        () => _i21.FollowBloc(gh<_i8.FollowRepository>()));
    gh.factory<_i22.PostFormBloc>(() => _i22.PostFormBloc(
          gh<_i10.PlaylistRepository>(),
          gh<_i11.PostRepository>(),
        ));
    gh.factory<_i23.ProfileBloc>(() => _i23.ProfileBloc(
          gh<_i12.ProfileRepository>(),
          gh<_i4.BlockRepository>(),
        ));
    gh.factory<_i24.StreamingBloc>(
        () => _i24.StreamingBloc(gh<_i15.StreamingRepository>()));
    return this;
  }
}
