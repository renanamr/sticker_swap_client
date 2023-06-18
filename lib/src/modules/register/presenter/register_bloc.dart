import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/register/domain/usecases/register_user.dart';

class RegisterBloc{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  final registerUsecase = Modular.get<IRegisterUser>();

  void verifyAuth()=> Modular.to.pushNamedAndRemoveUntil("/", (_)=> false);

  Future<Map?> register()async{
    if(passwordController.text == passwordConfirmController.text){
      bool sucesso = await registerUsecase(emailController.text, passwordController.text);
      if(sucesso) verifyAuth();
    }
  }
}