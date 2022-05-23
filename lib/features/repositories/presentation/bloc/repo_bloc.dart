import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sputnik_test/core/entities/failures.dart';
import 'package:sputnik_test/core/entities/repo_info.dart';
import 'package:sputnik_test/core/services/github_service.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  RepoBloc() : super(RepoInitialState()) {
    on<RepoEvent>(
      (event, emit) async {
        if (event is OnGetRepo) {
          emit(RepoLoadingState());

          final result = await GithubService().getRepo(event.user);

          result.fold(
            (failure) {
              if (failure is TooManyAttemptsFailure) {
                emit(TooManyAttemptsState());
              } else {
                emit(SomethingWentWrongState());
              }
            },
            (repoList) {
              if (repoList.isEmpty) {
                emit(RepoEmptyState());
              } else {
                emit(RepoLoadedState(repoList));
              }
            },
          );
        }
      },
    );
  }
}
