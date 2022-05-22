part of 'search_user_bloc.dart';

@immutable
abstract class SearchUserState extends Equatable {}

class SearchUserInitial extends SearchUserState {
  @override
  List<Object> get props => [];
}

class SearchUserLoadingState extends SearchUserState {
  @override
  List<Object> get props => [];
}

class UserNotFoundState extends SearchUserState {
  @override
  List<Object> get props => [];
}

class UserFoundedState extends SearchUserState {
  UserFoundedState(this.user);

  final UserInfo user;

  @override
  List<Object> get props => [user];
}

class SomethingWentWrongState extends SearchUserState {
  @override
  List<Object> get props => [];
}
