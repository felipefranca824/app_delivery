import 'dart:developer';

import 'package:app_delivery/app/core/exception/user_not_found_exception.dart';
import 'package:app_delivery/app/core/rest_client/rest_client.dart';
import 'package:app_delivery/app/models/user_model.dart';
import 'package:app_delivery/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImplementation({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(UserModel user) async {
    final result = await _restClient.post('/auth/register', {
      "name": user.name,
      "email": user.email,
      "password": user.password,
    });

    if (result.hasError) {
      var message = "Erro ao registrar usuário";
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message: message);
    }

    return login(user.email, user.password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth/', {
      "email": email,
      "password": password,
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log('usúario ou senha inválidos',
            error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotFoundException();
      }

      log(
        'erro ao autenticar usúario (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message: 'Erro ao autenticar usúario');
    }

    return UserModel.fromMap(result.body);
  }
}
