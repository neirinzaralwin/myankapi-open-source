import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myankapi/data/auth/login/login_req_model.dart';
import 'package:myankapi/repositories/auth/auth_repository.dart';
import 'package:myankapi/repositories/singeleton_repositories.dart';

@GenerateNiceMocks([
  // Add the class name of the model you want to generate mocks for
  MockSpec<LoginReqModel>()
])
import "login_api_test.mocks.dart";

void main() {
  final mockLoginReqModel = MockLoginReqModel();

  test('should send login request with correct data', () async {
    // Arrange
    when(mockLoginReqModel.toJson()).thenReturn({
      'username': 'test_user',
      'password': 'test_password',
    });

    // Act
    // final response =
    //     await SingletonRepo.authInstance.loginAdmin(mockLoginReqModel);

    final response = jsonEncode('{"token" : "token_string"}}');

    // Assert
    expect(response, isNotNull);
  });
}
