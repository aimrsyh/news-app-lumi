//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumi_news/bloc/news_bloc.dart';
import 'package:lumi_news/bloc/news_events.dart';
import 'package:lumi_news/bloc/news_state.dart';
import 'package:lumi_news/model/news_model.dart';
import 'package:lumi_news/page/home/news_details_page.dart';

class NewsCardLatest extends StatefulWidget {
  NewsCardLatest({
    super.key,
  });

  @override
  State<NewsCardLatest> createState() => _NewsCardLatestState();
}

class _NewsCardLatestState extends State<NewsCardLatest> {
  PageController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(GetDataLatest());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsBloc, NewsState>(
      listener: (context, state) {
        if (state is NewsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
            ),
          );
        }
      },
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            List<NewsModel> data = state.mydata;
            return MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: double.maxFinite,
                    child: GestureDetector(
                      onTap: () {
                        final snackBar = SnackBar(
                            content: Text(
                              "Ads from the publisher's website",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetails(
                              link: data[index].link,
                              title: data[index].publisherName,
                              image: data[index].publisherImageUrl,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 3,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 110,
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    data[index].imageUrl,
                                  ),
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
                                      data[index].publisherName,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      data[index].newsTitle,
                                      maxLines: 3,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      data[index].updated,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
