import 'dart:ui';

import 'package:Flutter_GPT/consts/global_colors.dart';
import 'package:Flutter_GPT/services/api_services.dart';
import 'package:Flutter_GPT/services/services.dart';
import 'package:Flutter_GPT/widgets/chatWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ApiService.getModels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: lightGptColor,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage("assets/images/openai_logo.jpg"),
            ),
          ),
          title: const Text(
            "ChatGPT",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Services.showBottomModal(context);
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ))
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: Conversations.length,
                  itemBuilder: (context, index) {
                    return chatWidget(
                        chatIndex: int.parse(
                            Conversations[index]['chatIndex'].toString()),
                        message: Conversations[index]['msg'].toString());
                  },
                ),
              ),
              // const Spacer(),
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 20,
              ),
              Container(
                color: lightGptColor,
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const TextField(
                              cursorColor: Colors.grey,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Send a Message ...",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ))),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
