import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

class SplashScreenBloc{

  final _auth = auth.FirebaseAuth.instance;
  final _user = Modular.get<User>();

  void verifyAuth() {
    final user = _auth.currentUser;

    if(user == null) {
      Modular.to.pushReplacementNamed("/login/");
    } else{
      _user.id = user.uid;
      _user.email = user.email;

      Modular.to.pushReplacementNamed("/home/");
    }
  }
}