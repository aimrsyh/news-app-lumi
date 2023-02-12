import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lumi_news/utils/colors.dart';

class SettingsWidget extends StatelessWidget {
  final String text;

  const SettingsWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      width: double.maxFinite,
      height: 60,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.blue,
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: AppColors.container,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              //offset: Offset(0, 3),
              color: AppColors.container,
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
