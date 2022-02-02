import 'package:app_delivery/app/core/constants/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthServices extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthServices> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      _isLogged(value != null);
    });

    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });

    final isLoggedData = getUserId() != null;
    _isLogged(isLoggedData);
    return this;
  }

  void logout() => _getStorage.write(Constants.USER_KEY, null);

  int? getUserId() => _getStorage.read(Constants.USER_KEY);
}
