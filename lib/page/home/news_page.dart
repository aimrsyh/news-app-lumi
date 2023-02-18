import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lumi_news/bloc/news_bloc.dart';
import 'package:lumi_news/bloc/news_events.dart';
import 'package:lumi_news/page/settings/topics/topics_page.dart';
import 'package:lumi_news/repo/news_repo.dart';
import 'package:lumi_news/utils/colors.dart';
import 'package:lumi_news/widgets/news_card_latest.dart';
import 'package:lumi_news/utils/dimensions.dart';
import 'package:lumi_news/widgets/news_card_news.dart';
import 'package:lumi_news/widgets/news_card_trending.dart';
import 'package:lumi_news/widgets/tab_container_widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  String _bigTitle = "";
  String _smallTitle = "";

  TopicPage topicPage = TopicPage();
//_TopicPageState topicPageState = topicPage.createState();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 1 + 2, vsync: this);
    _updateAppBarTitle();
  }

  void _updateAppBarTitle() {
    final hour = DateTime.now().hour;
    setState(() {
      if (hour < 12) {
        _bigTitle = "Good Morning";
        _smallTitle = "Catch up on news you've missed";
      } else if (hour < 14) {
        _bigTitle = "Good Afternoon";
        _smallTitle = "";
      } else if (hour < 18) {
        _bigTitle = "Good Evening";
        _smallTitle = "Here's what you've missed";
      } else {
        _bigTitle = "Good Night";
        _smallTitle = "Have a good rest!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _bigTitle,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _smallTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined),
                  color: Colors.black,
                ),
              ],
              bottom: ButtonsTabBar(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                buttonMargin: EdgeInsets.only(left: 8.0, right: 8.0),
                center: false,
                radius: 100,
                backgroundColor: Colors.blue,
                unselectedBackgroundColor: AppColors.container,
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: "Latest  ⚡️"),
                  Tab(text: "Trending  🔥"),
                  Tab(text: "News  ☕️"),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: BlocProvider<NewsBloc>(
          create: (context) =>
              NewsBloc(newsRepo: RepositoryProvider.of(context)),
          child: TabBarView(
            children: <Widget>[
              NewsCardLatest(
                  // BlocProvider.of<NewsBloc>(context).add(GetDataLatest());
                  ),
              NewsCardTrending(),
              NewsCardNews(),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}
