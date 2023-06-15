import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

abstract class ILogin{
  Future<bool> call (String email, String password);
}

class LoginImpl implements ILogin{

  final _auth = auth.FirebaseAuth.instance;
  final _user = Modular.get<User>();

  @override
  Future<bool> call(String email, String password) async{
    try{
      final user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      _user.id = user.user!.uid;
      _user.email = user.user!.email!;
      return true;
    }catch(e){
      rethrow;
    }
  }

}