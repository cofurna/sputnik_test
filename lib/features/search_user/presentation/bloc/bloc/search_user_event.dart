part of 'search_user_bloc.dart';

@immutable
abstract class SearchUserEvent extends Equatable {}

class OnSearchUser extends SearchUserEvent {
  OnSearchUser(this.user);

  final String user;

  @override
  List<Object> get props => [user];
}
