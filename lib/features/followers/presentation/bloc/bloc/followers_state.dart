part of 'followers_bloc.dart';

@immutable
abstract class FollowersState extends Equatable {}

class FollowersInitialState extends FollowersState {
  @override
  List get props => [];
}

class FollowersLoadingState extends FollowersState {
  @override
  List<Object> get props => [];
}

class FollowersLoadedState extends FollowersState {
  FollowersLoadedState(this.followersList);

  final List<FollowerInfo> followersList;
  @override
  List<Object> get props => [followersList];
}

class SomethingWentWrongState extends FollowersState {
  @override
  List<Object> get props => [];
}

class TooManyAttemptsState extends FollowersState {
  @override
  List<Object> get props => [];
}

class FollowersEmptyState extends FollowersState {
  @override
  List<Object> get props => [];
}
