part of 'following_bloc.dart';

@immutable
abstract class FollowingState extends Equatable {}

class FollowingInitialState extends FollowingState {
  @override
  List<Object> get props => [];
}

class FollowingLoadingState extends FollowingState {
  @override
  List<Object> get props => [];
}

class FollowingLoadedState extends FollowingState {
  FollowingLoadedState(this.followingList);

  final List<FollowingInfo> followingList;
  @override
  List<Object> get props => [followingList];
}

class SomethingWentWrongState extends FollowingState {
  @override
  List<Object> get props => [];
}

class TooManyAttemptsState extends FollowingState {
  @override
  List<Object> get props => [];
}

class FollowingEmptyState extends FollowingState {
  @override
  List<Object> get props => [];
}
