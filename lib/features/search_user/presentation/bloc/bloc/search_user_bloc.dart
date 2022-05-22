import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:sputnik_test/core/entities/failures.dart';
import 'package:sputnik_test/core/services/github_service.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
part 'search_user_event.dart';
part 'search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  SearchUserBloc() : super(SearchUserInitial()) {
    on<SearchUserEvent>((event, emit) async {
      if (event is OnSearchUser) {
        emit(SearchUserLoadingState());

        final result = await GithubService().getUser(event.user);

        result.fold(
          (failure) {
            if (failure is UserNotFoundFailure) {
              emit(UserNotFoundState());
            } else {
              emit(SomethingWentWrongState());
            }
          },
          (user) {
            emit(UserFoundedState(user));
          },
        );
      }
    });
  }
}
