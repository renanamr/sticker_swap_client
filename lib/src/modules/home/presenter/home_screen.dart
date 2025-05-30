import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/chat/presenter/chat_module.dart';
import 'package:sticker_swap_client/src/modules/home/presenter/home_bloc.dart';
import 'package:sticker_swap_client/src/modules/home/presenter/widgets/home_bottom_navigator_bar.dart';
import 'package:sticker_swap_client/src/modules/settings/presenter/settings_module.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/sticker_module.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeBloc> {


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Color(0xff9A1032)),
        child: StreamBuilder<int>(
            initialData: 0,
            stream: controller.getIndexTela,
            builder: (_, snapshot) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      //Colocar depois demais itens do menu
                      if(snapshot.data == 0 || snapshot.data == 1)
                        StickerModule(idModePage: snapshot.data!,),
                      if(snapshot.data == 2)
                        ChatModule(),
                      if(snapshot.data == 3)
                        SettingsModule(),
                    ],
                  ),
                ),

                bottomNavigationBar: HomeBottomNavigatorBar(
                  onTap: controller.mudarTela,
                  indexTelaAtual: snapshot.data!,
                  selectedIconColor: Theme.of(context).primaryColor,
                ),
              );
            }
        )
    );
  }
}
