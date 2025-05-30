import 'package:flutter/material.dart';

class BottomMessageChat extends StatelessWidget {

  final TextEditingController controller;
  final Function() markLocation;
  final Function() swapSticker;
  final Function() sendText;

  const BottomMessageChat({
    required this.markLocation,
    required this.swapSticker,
    required this.controller,
    required this.sendText,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(height: 0.1),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 5),
            child: Row(
              children:  <Widget>[
                Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Escreva uma mensagem...",
                    contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    )
                  ),
                )
                ),
                const SizedBox(width: 6,),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xff9A1032),
                  child: IconButton(
                        onPressed: sendText,
                        icon: const ImageIcon(
                          AssetImage('assets/images/send_image.png'),
                          color: Colors.white,
                          size: 45,
                        ),
                    ),
                )
              ],
            ),
          ),
          const Divider(height: 2),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              children: [
                TextButton(
                  onPressed: swapSticker,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      side: const BorderSide(color: Color(0xff9A1032)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                    ),
                  child: const Text(
                      "Trocar figurinhas",
                       style: TextStyle(fontSize: 14, color: Colors.black)),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: TextButton(
                    onPressed: markLocation,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        side: const BorderSide(color: Color(0xff9A1032)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                      ),
                    child: const Text(
                        "Marcar local de troca",
                         style: TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                ),

                /*
                TextButton(
                  onPressed: (){},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      side: const BorderSide(color: Color(0xff9A1032)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                    ),
                  child: const Text(
                      "Ver trocas feitas",
                      style: TextStyle(fontSize: 14, color: Colors.black)
                  ),
                )
                 */
              ],
            ),
          )
        ],
      ),
    );
  }
}
