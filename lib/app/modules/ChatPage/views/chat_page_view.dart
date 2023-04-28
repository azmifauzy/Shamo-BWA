import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/models/message_model.dart';
import 'package:shamo_app/app/providers/auth_provider.dart';
import 'package:shamo_app/app/services/message_service.dart';
import 'package:shamo_app/theme.dart';

import '../controllers/chat_page_controller.dart';
import 'package:shamo_app/app/widgets/ChatTile.dart';

class ChatPageView extends GetView<ChatPageController> {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          "Message Support",
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
            width: double.infinity,
            color: bgColor3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/hengset.png',
                  width: 80,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Opss no message yet?",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "You have never done a transaction",
                  style: secondaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 44,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: primaryColor),
                      child: Text(
                        "Explore Store",
                        style: primaryTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      )),
                )
              ],
            )),
      );
    }

    Widget listChat() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user!.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
              return Expanded(
                  child: Container(
                      width: double.infinity,
                      color: bgColor3,
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        children: [ChatTile(), ChatTile(), ChatTile()],
                      )));
            } else {
              return Center(
                child: Text("Tidak ada Chat"),
              );
            }
          });
    }

    return Column(
      children: [header(), listChat()],
    );
  }
}
