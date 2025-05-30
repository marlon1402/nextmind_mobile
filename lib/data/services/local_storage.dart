import 'package:get/get.dart';
import 'package:nextmind_mobile/utils/exceptions/local_storage_exception.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxService {
  AsyncResult<String> saveData(String key, String value) async {
    try {
      final shared = await SharedPreferences.getInstance();
      shared.setString(key, value);
      return Success(value);
    } catch (e) {
      return Failure(LocalStorageException('Failed to save data'));
    }
  }

  AsyncResult<String> getData(String key) async {
    try {
      final shared = await SharedPreferences.getInstance();
      final value = shared.getString(key);
      if (value == null) {
        return Failure(EmptyLocalStorageException(key));
      }
      return Success(value);
    } catch (e) {
      return Failure(LocalStorageException('Failed to get data'));
    }
  }

  AsyncResult<Unit> removeData(String key) async {
    try {
      final shared = await SharedPreferences.getInstance();
      shared.remove(key);
      return Success.unit();
    } catch (e) {
      return Failure(LocalStorageException('Failed to remove data'));
    }
  }
}
