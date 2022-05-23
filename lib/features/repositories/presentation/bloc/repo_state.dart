part of 'repo_bloc.dart';

@immutable
abstract class RepoState extends Equatable {}

class RepoInitialState extends RepoState {
  @override
  List<Object> get props => [];
}

class RepoLoadingState extends RepoState {
  @override
  List<Object> get props => [];
}

class SomethingWentWrongState extends RepoState {
  @override
  List<Object> get props => [];
}

class TooManyAttemptsState extends RepoState {
  @override
  List<Object> get props => [];
}

class RepoLoadedState extends RepoState {
  RepoLoadedState(this.repoList);

  final List<RepoInfo> repoList;
  @override
  List<Object> get props => [repoList];
}

class RepoEmptyState extends RepoState {
  @override
  List<Object> get props => [];
}
