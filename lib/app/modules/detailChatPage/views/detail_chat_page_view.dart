import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/app/widgets/ChatBubble.dart';
import 'package:get/get.dart';

import '../controllers/detail_chat_page_controller.dart';

class DetailChatPageView extends GetView<DetailChatPageController> {
  const DetailChatPageView({Key? key}) : super(key: key);

  Widget header() {
    return AppBar(
      backgroundColor: bgColor1,
      title: Row(
        children: [
          Image.asset(
            "assets/images/logo-shop-online.png",
            width: 50,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shoe Store",
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
                Text(
                  "Online",
                  style: secondaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: light),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
      elevation: 0,
    );
  }

  Widget productPreview() {
    return Container(
      width: 225,
      height: 74,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor5,
          border: Border.all(color: primaryColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/shoes.png",
                width: 54,
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "COURT VISION 2.0",
                  style: primaryTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "\$67,15",
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/close.png",
            width: 22,
          )
        ],
      ),
    );
  }

  Widget chatInput() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          productPreview(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: bgNavColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                          hintText: 'Type Message...',
                          hintStyle: subtitleTextStyle),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/images/button-send.png",
                width: 45,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget content() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      children: [
        ChatBubble(
          msg:
              "Hi, is this item still available bro? I wanna order right fxcking now",
          isSender: true,
          hasProduct: true,
        ),
        ChatBubble(
          msg: "Yes, u can order now",
          isSender: false,
          hasProduct: false,
        ),
        ChatBubble(
          msg: "Okay",
          isSender: true,
          hasProduct: false,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(70), child: header()),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
