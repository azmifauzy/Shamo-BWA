import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo_app/theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: defaultMargin, left: defaultMargin, right: defaultMargin),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semibold),
      ),
    );
  }
}
