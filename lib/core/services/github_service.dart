import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:sputnik_test/core/entities/failures.dart';
import 'package:sputnik_test/core/entities/user_info.dart';

class GithubService {
  Future<Either<Failure, UserInfo>> getUser(String user) async {
    try {
      final response = await Dio().get('https://api.github.com/users/$user');
      if (response.statusCode == 200) {
        return Right(UserInfo.fromJson(response.data));
      }

      return Left(UserNotFoundFailure());
    } on DioError catch (dioError) {
      if (dioError.response == null) {
        return Left(SomethingWentWrong());
      }

      if (dioError.response!.statusCode == 404) {
        return Left(UserNotFoundFailure());
      }

      return Left(SomethingWentWrong(
        message: dioError.response!.statusMessage,
      ));
    } catch (exception) {
      return Left(SomethingWentWrong());
    }
  }
}
