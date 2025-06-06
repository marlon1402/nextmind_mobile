import 'package:get/get.dart';
import 'package:nextmind_mobile/domain/dtos/credentials/credentials.dart';
import 'package:nextmind_mobile/domain/models/user/user.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AuthRepository extends GetxController {
  static AuthRepository get to => Get.find<AuthRepository>();

  late RxBool userIsAuthenticated;

  AsyncResult<User> getUser();

  AsyncResult<User> registerWithEmail(Credentials credentials);
  AsyncResult<User> loginWithEmail(Credentials credentials);
  AsyncResult<User> loginWithGoogle();
  AsyncResult<Unit> logout();
}
