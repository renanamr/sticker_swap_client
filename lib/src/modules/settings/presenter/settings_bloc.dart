import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsBloc{

  void logout() async {
    FirebaseAuth.instance.signOut();
    Modular.to.pushReplacementNamed('/login/');
  }

}