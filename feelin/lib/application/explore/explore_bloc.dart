import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/explore/explore_post_repository.dart';

part 'explore_event.dart';
part 'explore_state.dart';
part 'explore_bloc.freezed.dart';

@injectable
class ExploreBloc extends Bloc<ExploreEvent, ExploreState>{
  final ExplorePostRepository _explorePostRepository;
  ExploreBloc(this._explorePostRepository) : super(ExploreState.initial()){

  }
}