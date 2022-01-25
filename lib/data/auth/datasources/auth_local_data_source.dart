import 'package:restaurant_app/core/constants/key_constants.dart';
import 'package:restaurant_app/core/utils/services/shared_prefs.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<void> isTeacher(bool isTeacher);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.sharedPrefs);

  final SharedPrefs sharedPrefs;

  @override
  Future<void> saveToken(String token) {
    return sharedPrefs.putString(KeyConstants.keyAccessToken, token);
  }

  @override
  Future<void> isTeacher(bool isTeacher) {
    return sharedPrefs.putBool(KeyConstants.keyIsTeacher, isTeacher);
  }
}
