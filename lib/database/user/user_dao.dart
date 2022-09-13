import 'package:floor/floor.dart';
import 'package:flutter_base/database/user/user.dart';
//access
@dao
abstract class UserDAO {
  // Forgot password screen
  @update
  Future<void> updatePassword(User updatePass);

  // Register screen
  @insert
  Future<void> insertRegister(User register);

  // Login screen
  @Query('SELECT * FROM User WHERE phone_number = :phone AND pass_word = :pass')
  Future<User?> findUserByPhoneAndPass(String phone, String pass);

  @Query('SELECT * FROM User')
  Future<List<User>> retrieveUsers();
}
