import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lumi_news/utils/colors.dart';
import 'package:lumi_news/widgets/publisher_widget.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.blue,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Statistics",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.white,
              //alignment: Alignment.topRight,
              //padding: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Last Read Article",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    height: 100,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 3,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 110,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://image.luminews.my/fhs309nl0g9n8u1rckswbdexzdve'),
                              ),
                            ),
                          ),
                          Container(
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'TechNave',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "A man got scammed out of RM23K for trying to buy a fake Touch 'n Go family package plan online",
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Total Read Article",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 100,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.container),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "50",
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Most Read News Category",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.container,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Trending 🔥",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Top 3 News Publisher",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.container),
                            ),
                            Image(
                                image: NetworkImage(
                                    "https://image.luminews.my/21eaac4t1vf2iesdatu940xcvb6y"))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.container),
                            ),
                            Image(
                                image: NetworkImage(
                                    "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0"))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.container),
                            ),
                            Image(
                                image: NetworkImage(
                                    "https://image.luminews.my/c1tb5x8fn5j5brchdqsuv6j5x6ta"))
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
