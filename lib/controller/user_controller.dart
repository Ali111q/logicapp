import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logic_study_app/controller/collage_controller.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import '../features/university/ui/pick_university.dart';
import '../helper/image_picker.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;

import '../service/shared_preferences.dart';
import '../utils/constant.dart';

class UserController extends ChangeNotifier {
  SharedService _service = SharedService();
  User? user;
  bool isLogin = false;
  Map? image;
  Future<User?> getUserFromShared() async {
    await _service.initialize();
    user = await _service.getUser();
    print(user);
    return user;
  }

  Future<bool?> login(
      String email, String password, BuildContext context) async {
    _service.initialize();
    try {
      http.Response _res = await http.post(Uri.parse(loginUrl),
          body: jsonEncode({'email': email, 'password': password}),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          });
      if (_res.statusCode == 201) {
        var json = await jsonDecode(_res.body);
        print(json);
        user = User.fromJson(json);
        if (user != null) {
          _service.saveUser(user!);
          Provider.of<CollageController>(context, listen: false)
              .setToken(user!.token);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => PickUniversity(),
          ));

          notifyListeners();

          return true;
        }
      } 
        
       else {
        // var json = await jsonDecode();
        print(_res.body);
        toast(_res.body);
      }
    } catch (e) {
      toast(e.toString());
    }
  }

  Future<void> register(
      String email, String name, String password, BuildContext context) async {
    _service.initialize();
    print('object');
    http.Response _res = await http.post(Uri.parse(registerUrl),
        body: jsonEncode({
          'email': email,
          'password': password,
          'username': name,
          if (image != null) 'image': image!['base64']
        }),
        headers: {"content-type": "application/json"});
    print(_res.statusCode);
    if (_res.statusCode == 201) {
      var json = await jsonDecode(_res.body);

      user = User.fromJson(json);
      _service.saveUser(user!);
      Provider.of<CollageController>(context, listen: false)
          .setToken(user!.token);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => PickUniversity(),
      ));
    } else if (_res.statusCode == 404) {
      var json = await jsonDecode(_res.body);

      toast(json['message']);
    } else {
      toast("حصل خطأ");
    }
    notifyListeners();
  }

  Future<void> logout() async {
    _service.clear();
  }

  clearImage() {
    image = null;
    notifyListeners();
  }
}
