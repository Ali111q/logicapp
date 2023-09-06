import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SharedService {

  late SharedPreferences shared;
  Future<void> initialize() async {
    shared = await SharedPreferences.getInstance();
  }

  Future<User?> getUser() async{
    String? id = shared.getString('id');
    if (id == null) {
      return null;
    }

    return User(
        id: id,
        token: shared.getString('token') ?? '',
        name: shared.getString('name') ?? '',
        email: shared.getString('email') ?? '',);
  }

  void saveUser( User user) {
    shared.setString('id', user.id);
    shared.setString('token', user.token??'');
    shared.setString('name', user.name??'');
    shared.setString('mobile', user.email??'');

  }

  Future<void> clear() async {
    shared.clear();
  }
}
