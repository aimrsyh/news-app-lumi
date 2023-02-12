import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lumi_news/page/settings/statistics/statistics_page.dart';
import 'package:lumi_news/page/settings/topics/topics_page.dart';
import 'package:lumi_news/widgets/settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //final String Text =
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Text(
              "Settings",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TopicPage()));
                },
                child: SettingsWidget(
                  text: "Topics  🗂",
                )),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StatisticsPage()));
              },
              child: SettingsWidget(
                text: "Statistics  📊",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
