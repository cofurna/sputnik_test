import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sputnik_test/core/entities/failures.dart';

import 'package:sputnik_test/core/entities/following_info.dart';
import 'package:sputnik_test/core/services/github_service.dart';

part 'following_event.dart';
part 'following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  FollowingBloc() : super(FollowingInitialState()) {
    on<FollowingEvent>((event, emit) async {
      if (event is OnGetFollowing) {
        emit(FollowingLoadingState());

        final result = await GithubService().getFollowing(event.user);

        result.fold(
          (failure) {
            if (failure is TooManyAttemptsFailure) {
              emit(TooManyAttemptsState());
            } else {
              emit(SomethingWentWrongState());
            }
          },
          (followingList) {
            if (followingList.isEmpty) {
              emit(FollowingEmptyState());
            } else {
              emit(FollowingLoadedState(followingList));
            }
          },
        );
      }
    });
  }
}
