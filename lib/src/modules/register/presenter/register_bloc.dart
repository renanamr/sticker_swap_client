import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/register/domain/usecases/register_user.dart';

class RegisterBloc{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  void verifyAuth()=> Modular.to.pushReplacementNamed("/login/");

  Future<Map?> register()async{
    RegisterUserImpl userImpl = RegisterUserImpl();
    userImpl.call("renan@gmail.com", "Senha123@");
  }
}