import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:lumi_news/model/news_model.dart';

class NewsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<NewsModel>> getDataLatest() async {
    List<NewsModel> newsList = [];

    try {
      final newsLatest = await _firestore.collection("latest").get();

      newsLatest.docs.forEach((element) {
        return newsList.add(NewsModel.fromJson(element.data()));
      });

      return newsList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code} : ${e.message}'");
      }
      return newsList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<NewsModel>> getDataTrending() async {
    final snapshot = await _firestore.collection("trending").get();
    return snapshot.docs.map((doc) => NewsModel.fromJson(doc.data())).toList();
  }

  Future<List<NewsModel>> getDataNews() async {
    final snapshot = await _firestore.collection("news").get();
    return snapshot.docs.map((doc) => NewsModel.fromJson(doc.data())).toList();
  }
}
