import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:sputnik_test/core/entities/failures.dart';
import 'package:sputnik_test/core/entities/follower_info.dart';
import 'package:sputnik_test/core/entities/repo_info.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/core/entities/following_info.dart';

class GithubService {
  Future<Either<Failure, UserInfo>> getUser(String user) async {
    try {
      final response = await Dio().get('https://api.github.com/users/$user');
      if (response.statusCode == 200) {
        return Right(UserInfo.fromJson(response.data));
      }

      return Left(NotFoundedFailure());
    } on DioError catch (dioError) {
      return Left(failurefromDioError(dioError));
    } catch (exception) {
      return Left(SomethingWentWrong());
    }
  }

  Future<Either<Failure, List<FollowingInfo>>> getFollowing(String user) async {
    try {
      final response =
          await Dio().get('https://api.github.com/users/$user/following');
      if (response.statusCode == 200) {
        return Right(FollowingInfo.fromJsonList(response.data));
      }
      return Left(SomethingWentWrong());
    } on DioError catch (dioError) {
      return Left(failurefromDioError(dioError));
    } catch (exception) {
      return Left(SomethingWentWrong());
    }
  }

  Future<Either<Failure, List<RepoInfo>>> getRepo(String user) async {
    try {
      final response =
          await Dio().get('https://api.github.com/users/$user/repos');
      if (response.statusCode == 200) {
        return Right(RepoInfo.fromJsonList(response.data));
      }
      return Left(SomethingWentWrong());
    } on DioError catch (dioError) {
      return Left(failurefromDioError(dioError));
    } catch (exception) {
      return Left(SomethingWentWrong());
    }
  }

  Future<Either<Failure, List<FollowerInfo>>> getFollowers(String user) async {
    try {
      final response =
          await Dio().get('https://api.github.com/users/$user/followers');
      if (response.statusCode == 200) {
        return Right(FollowerInfo.fromJsonList(response.data));
      }
      return Left(SomethingWentWrong());
    } on DioError catch (dioError) {
      return Left(failurefromDioError(dioError));
    } catch (exception) {
      return Left(SomethingWentWrong());
    }
  }
}
