import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sputnik_test/core/entities/failures.dart';
import 'package:sputnik_test/core/entities/follower_info.dart';
import 'package:sputnik_test/core/services/github_service.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  FollowersBloc() : super(FollowersInitialState()) {
    on<FollowersEvent>(
      (event, emit) async {
        if (event is OnGetFollowers) {
          emit(FollowersLoadingState());

          final result = await GithubService().getFollowers(event.user);

          result.fold(
            (failure) {
              if (failure is TooManyAttemptsFailure) {
                emit(TooManyAttemptsState());
              } else {
                emit(SomethingWentWrongState());
              }
            },
            (followersList) {
              if (followersList.isEmpty) {
                emit(FollowersEmptyState());
              } else {
                emit(FollowersLoadedState(followersList));
              }
            },
          );
        }
      },
    );
  }
}
