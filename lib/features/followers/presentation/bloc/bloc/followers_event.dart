part of 'followers_bloc.dart';

@immutable
abstract class FollowersEvent extends Equatable {}

class OnGetFollowers extends FollowersEvent {
  OnGetFollowers(this.user);

  final String user;
  @override
  List get props => [user];
}
