import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lumi_news/utils/colors.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  final List<String> topics = ['Trending  🔥', 'News  ☕️'];
  List<bool> isSelected = [false, false];
  //List<bool> get selectedTopics => isSelected;

  List<String> getSelectedTopics() {
    return topics
        .asMap()
        .entries
        .where((entry) => isSelected[entry.key])
        .map((entry) => entry.value)
        .toList();
  }

  void onTap(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
    String message;
    if (isSelected[index]) {
      message = 'You are now following ${topics[index]}';
    } else {
      message = 'Unfollowed ${topics[index]}';
    }

    final snackBar = SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        shape: StadiumBorder(),
        width: 230);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // get selectedTopics {
  //   return topics
  //       .asMap()
  //       .entries
  //       .where((entry) => isSelected[entry.key])
  //       .map((entry) => entry.value)
  //       .toList();
  // }

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
            color: AppColors.arrow,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Topics",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.white,
              height: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(15.0),

                // implement GridView.builder
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 1.3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: topics.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () => onTap(index),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: isSelected[index]
                                  ? AppColors.check
                                  : AppColors.container,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  topics[index],
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              if (isSelected[index])
                                Container(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.only(
                                    right: 10,
                                    top: 10,
                                  ),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
