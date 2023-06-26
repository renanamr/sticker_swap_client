
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessagePlace extends Message{

  String time;
  String place;
  String date;

  int status;

  MessagePlace({
    required this.time,
    required this.place,
    required this.date,
    required this.status,

    super.id,
    required super.idSender,

    super.type = 2,
    super.message = "Local de troca",
  });


}