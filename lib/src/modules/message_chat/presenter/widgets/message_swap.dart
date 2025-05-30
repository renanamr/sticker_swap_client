import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/utils/const/group_names_utils.dart';
import 'package:sticker_swap_client/src/utils/const/status_message_confirm.dart';

import '../../../chat/domain/entities/chat.dart';

class MessageSwap extends StatelessWidget {
  final String? id;
  final bool isMy;
  final MessageSwapStickers message;
  final Chat chat;
  final Function({required MessageSwapStickers message, required int newStatus}) availableSwap;
  final Function({required MessageSwapStickers message}) editSwap;

  const MessageSwap(
      {Key? key,
      this.id,
      required this.isMy,
      required this.message,
      required this.availableSwap,
      required this.editSwap,
      required this.chat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMy) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(100.0, 10.0, 10.0, 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: _textSwap(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      wordSpacing: 1)),
            ),
            _buttonStatus()
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 100.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Ink(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: _textSwap(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1)),
            ),
            if (message.status == StatusMessageConfirm.wait)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buttonReject(),
                  _buttonAccepted(),
                ],
              )
            else
              _buttonStatus()
          ],
        ),
      );
    }
  }

  Widget _textSwap({TextStyle? textStyle}) {
    return InkWell(
      onTap: () {
        if (!isMy && message.status != StatusMessageConfirm.accepted){
          editSwap(message: message);
        }
      },
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Sugestão de troca",
                  style: textStyle,
                ),
                const SizedBox(
                  width: 10,
                ),
                if (!isMy && message.status != StatusMessageConfirm.accepted)
                  const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Darei:",
              style: textStyle,
            ),
            Divider(
              height: 8,
              color: textStyle?.color,
            ),
            Text(
              _textGroupSticker(message.stickersSender),
              style: textStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Quero:",
              style: textStyle,
            ),
            Divider(
              height: 8,
              color: textStyle?.color,
            ),
            Text(
              _textGroupSticker(message.stickersNeed),
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonStatus() {
    if (message.status == StatusMessageConfirm.accepted) {
      return _buttonAccepted();
    }
    if (message.status == StatusMessageConfirm.rejected) {
      return _buttonReject();
    }

    return const SizedBox(
      height: 2,
      width: 0,
    );
  }

  Widget _buttonAccepted() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          availableSwap(
              message: message,
              newStatus: StatusMessageConfirm.accepted
          );
        },
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Ink(
          padding: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }

  Widget _buttonReject() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          availableSwap(
              message: message, newStatus: StatusMessageConfirm.rejected);
        },
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Ink(
          padding: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
            color: Color(0xff9A1032),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }

  String _textGroupSticker(Album album) {
    String message = "";

    for (int i = 0; i <= 35; i++) {
      if (album.collectionStickers.containsKey(i)) {
        String stickesText = "";
        for (final sticker in album.collectionStickers[i]!) {
          if (sticker.quantity > 0)
            stickesText += "${sticker.text.substring(3)},";
        }

        if (stickesText != "") {
          if (message != "") message += "\n";

          message += "${GroupNamesUtils.names[i]!}: "
              "${stickesText.substring(0, stickesText.length - 1)}";
        }
      }
    }
    return message;
  }
}
