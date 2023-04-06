import 'package:flutter/foundation.dart';

import '../../model/user_model.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes_name.dart';
import '../user_view_model.dart';

class SplashServices {
  //Trying to get the data which we stored as Shared Preferences
  //Getter method of UserViewModel
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async{
      print(value.token);
      if (value.token == "null" || value.token.toString() == "") {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);

      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}