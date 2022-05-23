part of 'following_bloc.dart';

@immutable
abstract class FollowingEvent extends Equatable {}

class OnGetFollowing extends FollowingEvent {
  OnGetFollowing(this.user);

  final String user;

  @override
  List<Object> get props => [user];
}
