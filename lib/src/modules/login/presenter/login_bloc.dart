import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/auth.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/login/domain/usecases/login.dart';

class LoginBloc{

  final user = Modular.get<User>();
  final auth = Modular.get<Auth>();
  final loginUseCase = Modular.get<ILogin>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void verifyAuth()=> Modular.to.pushReplacementNamed("/");
  void toRegisterScreen()=> Modular.to.pushNamed("/register/");

  Future<void> login() async{
    if(await loginUseCase(emailController.text, passwordController.text)){
      verifyAuth();
    }
  }

}
