import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/app/models/message_model.dart';
import 'package:shamo_app/app/models/product_model.dart';
import 'package:shamo_app/app/providers/auth_provider.dart';
// import 'package:shamo_app/app/providers/product_provider.dart';
import 'package:shamo_app/app/services/message_service.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/app/widgets/ChatBubble.dart';
import 'package:get/get.dart';

// import '../controllers/detail_chat_page_controller.dart';

class DetailChatPageView extends StatefulWidget {
  const DetailChatPageView({super.key});

  @override
  State<DetailChatPageView> createState() => _DetailChatPageViewState();
}

class _DetailChatPageViewState extends State<DetailChatPageView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController messageC = TextEditingController(text: '');
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ProductModel product = Get.arguments;

    handleAddMessage() async {
      await MessageService().addMessage(
          user: authProvider.user,
          isFromUser: true,
          message: messageC.text,
          product: product);
      setState(() {
        product = UninitializedProductModel();
        messageC.text = '';
      });
    }

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
                    product.name!,
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "\$${product.price}",
                    style: priceTextStyle,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                "assets/images/close.png",
                width: 22,
              ),
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
            product is UninitializedProductModel
                ? SizedBox()
                : productPreview(),
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
                        controller: messageC,
                        style: primaryTextStyle,
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
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Image.asset(
                    "assets/images/button-send.png",
                    width: 45,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          key: Key("${Random().nextDouble()}"),
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            print(snapshot);
            if (snapshot.hasData == false) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  children: snapshot.data!
                      .map((MessageModel message) => ChatBubble(
                          msg: message.message!,
                          isSender: message.isFromUser!,
                          product: product))
                      .toList());
            }
          });
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(70), child: header()),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
