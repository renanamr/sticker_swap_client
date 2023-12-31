import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class Album {
  Map<int, List<Sticker>> collectionStickers;
  Album()
      : collectionStickers = {
          0: const [],
          1: const [],
          2: const [],
          3: const [],
        };
        
  Map<String, dynamic> toMap() {
    return {
      for (int i = 0; i < 38; i++)
        i.toString(): [
          for (Sticker sticker in collectionStickers[i]!) sticker.toMap(),
        ],
    };
  }
  
}
