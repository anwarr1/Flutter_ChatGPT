import 'package:Flutter_GPT/consts/global_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class chatWidget extends StatelessWidget {
  late int chatIndex;
  late String message;
  chatWidget({required this.chatIndex, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [mssg(message, chatIndex)],
    );
  }
}



Widget mssg(String answer, int chatIndex) {
  return Container(
    color: chatIndex == 1 ? lightGptColor : gptColor,
    padding: const EdgeInsets.all(5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: chatIndex == 1
              ? AssetImage("assets/images/chat_logo.png")
              : AssetImage("assets/images/person.png"),
          width: 30,
          height: 50,
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 4,
          child: Text(answer,
              // softWrap: true,
              // textAlign: TextAlign.start,
              style: const TextStyle(
                  height: 1.6,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15)),
        ),
        // const Spacer(),
        const SizedBox(width: 10),
        chatIndex == 1
            ? Expanded(
                child: Container(
                margin: EdgeInsets.only(right: 10),
                // color: Colors.green,
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite),
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.favorite)))
                  ],
                ),
              ))
            : SizedBox.shrink()
      ],
    ),
  );
}
