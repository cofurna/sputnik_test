part of 'repo_bloc.dart';

@immutable
abstract class RepoEvent extends Equatable {}

class OnGetRepo extends RepoEvent {
  OnGetRepo(this.user);

  final String user;

  @override
  List<Object> get props => [user];
}
