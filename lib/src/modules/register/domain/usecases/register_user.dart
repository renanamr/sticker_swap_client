import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:sticker_swap_client/src/modules/register/external/configs/register_album_config.dart';


abstract class IRegisterUser{
  Future<bool> call (String email, String password);
}

class RegisterUserImpl implements IRegisterUser{

  final _auth = auth.FirebaseAuth.instance;
  final _storage = FirebaseFirestore.instance;

  @override
  Future<bool> call(String email, String password) async{
    try{
      final user = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      await _storage.collection("album").doc(user.user!.uid)
          .set(RegisterAlbumConfig.init());

      return true;
    }catch(e){
      debugPrint(e.toString());
    }

    return false;
  }

}