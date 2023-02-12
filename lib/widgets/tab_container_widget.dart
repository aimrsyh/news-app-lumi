import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lumi_news/utils/colors.dart';

class TabContainerWidget extends StatelessWidget {
  final String text;
  const TabContainerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.container,
        borderRadius: BorderRadius.circular(50),
        //border: Border.all(color: Colors.redAccent, width: 1),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          (text),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
