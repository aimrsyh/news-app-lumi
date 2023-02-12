//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lumi_news/page/home/news_details_page.dart';

class NewsCard extends StatelessWidget {
  final CollectionReference collectionReference;

  NewsCard({super.key, required this.collectionReference});

  PageController? _controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: collectionReference.snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text("error");
        }

        if (snapshot.hasData) {
          QuerySnapshot querySnapshot = snapshot.data;
          List<QueryDocumentSnapshot> documents = querySnapshot.docs;

          List<Map> items = documents
              .map((e) => {
                    'id': e.id,
                    'newsTitle': e['newsTitle'],
                    'publisherName': e['publisherName'],
                    'imageUrl': e['imageUrl'],
                    'publisherImageUrl': e['publisherImageUrl'],
                    'link': e['link'],
                    'updated': e['updated'],
                    'publisherRectangleUrl': e['publisherRectangleUrl'],
                  })
              .toList();

          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Map thisItem = items[index];
                return Container(
                  //padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                            link: '${thisItem['link']}',
                            image: '${thisItem['publisherImageUrl']}',
                            title: '${thisItem['publisherName']}',
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
                                image: NetworkImage('${thisItem['imageUrl']}'),
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
                                    '${thisItem['publisherName']}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '${thisItem['newsTitle']}',
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
                                    '${thisItem['updated']}',
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
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
