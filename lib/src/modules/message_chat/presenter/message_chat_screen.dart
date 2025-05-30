import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_simple.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/message_chat_bloc.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/widgets/bottom_message_chat.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/widgets/message_localization.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/widgets/message_swap.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/widgets/message_tile.dart';

class MessageChatScreen extends StatefulWidget {
  final Chat chat;
  const MessageChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  State<MessageChatScreen> createState() => _MessageChatScreenState();
}

class _MessageChatScreenState extends ModularState<MessageChatScreen, MessageChatBloc> {

  @override
  void initState() {
    controller.getMessages(widget.chat);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _top(),
            Expanded(
                child: StreamBuilder<List<Message>>(
                  stream: controller.getMessagesView,
                  builder: (_, snapshot) {
                    if(!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator(),);
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      controller: controller.listScrollController,
                      itemBuilder: (_, index) {
                        if(snapshot.data![index] is MessageSimple) {
                          return MessageTile(
                            message: snapshot.data![index],
                            isMy: controller.isMyMessage(snapshot.data![index]),
                          );
                        }
                        if(snapshot.data![index] is MessageSwapStickers) {
                          return MessageSwap(
                            message: snapshot.data![index] as MessageSwapStickers,
                            isMy: controller.isMyMessage(snapshot.data![index]),
                            availableSwap: controller.availableSwap,
                            editSwap: controller.editSwap,
                            chat: widget.chat,
                            );
                        }

                        if(snapshot.data![index] is MessagePlace) {
                          return MessageLocalization(
                              message: snapshot.data![index] as MessagePlace,
                              isMy: controller.isMyMessage(snapshot.data![index]),
                              availableLocalization: controller.availableLocalization,
                          );
                        }

                        return const SizedBox(height: 2,);
                      },
                    );

                  }
                )
            ),
            BottomMessageChat(
              controller: controller.textController,
              markLocation: controller.markLocation,
              swapSticker: controller.swapSticker,
              sendText: controller.sendMessage,
            )
          ],
        ),
      ),
    );
  }


  Widget _top(){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
          border:  Border(
              bottom: BorderSide(color: Color.fromRGBO(117, 122, 163, 0.79)))
      ),

      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: (() => Modular.to.pop()),
          ),
          const SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: Text(widget.chat.name, style: const TextStyle(fontSize: 18)),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Acessou recentemente",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 122, 163, 1))),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
