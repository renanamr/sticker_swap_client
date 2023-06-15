import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/register/external/configs/register_album_config.dart';


abstract class IRegisterUser{
  Future<bool> call (String email, String password);
}

class RegisterUserImpl implements IRegisterUser{

  final _auth = auth.FirebaseAuth.instance;
  final _storage = FirebaseFirestore.instance;
  final _user = Modular.get<User>();

  @override
  Future<bool> call(String email, String password) async{
    try{
      final user = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      await _storage.collection("album").doc(user.user!.uid)
          .set(RegisterAlbumConfig.init());

      _user.id = user.user!.uid;
      _user.email = user.user!.email!;

      return true;
    }catch(e){
      debugPrint(e.toString());
    }

    return false;
  }

}