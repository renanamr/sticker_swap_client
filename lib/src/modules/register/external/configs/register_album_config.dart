import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class RegisterAlbumConfig{
  static Map<String, Map<String, dynamic>> init(){
    return {
    for(int i=1; i<=20; i++)
      "QAT $i": Sticker(id: i, text: "QAT $i", idGroup: 3, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "ECU $i" : Sticker(id: i, text: "ECU $i", idGroup: 4, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "SEN $i" : Sticker(id: i, text: "SEN $i", idGroup: 5, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "NED $i": Sticker(id: i, text: "NED $i", idGroup: 6, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "ENG $i": Sticker(id: i, text: "ENG $i", idGroup: 7, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "IRN $i": Sticker(id: i, text: "IRN $i", idGroup: 8, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "USA $i": Sticker(id: i, text: "USA $i", idGroup: 9, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "WAL $i": Sticker(id: i, text: "WAL $i", idGroup: 10, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "ARG $i": Sticker(id: i, text: "ARG $i", idGroup: 11, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "KSA $i": Sticker(id: i, text: "KSA $i", idGroup: 12, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "MEX $i": Sticker(id: i, text: "MEX $i", idGroup: 13, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "POL $i": Sticker(id: i, text: "POL $i", idGroup: 14, quantity:0).toMap(),


    for(int i=1; i<=20; i++)
      "BRA $i": Sticker(id: i, text: "BRA $i", idGroup: 27, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "SRB $i": Sticker(id: i, text: "SRB $i", idGroup: 28, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "SUI $i": Sticker(id: i, text: "SUI $i", idGroup: 29, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "CMR $i": Sticker(id: i, text: "CMR $i", idGroup: 30, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "POR $i": Sticker(id: i, text: "POR $i", idGroup: 31, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "GHA $i": Sticker(id: i, text: "GHA $i", idGroup: 32, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "URU $i": Sticker(id: i, text: "URU $i", idGroup: 33, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "KOR $i": Sticker(id: i, text: "KOR $i", idGroup: 34, quantity:0).toMap()
    };
  }
}