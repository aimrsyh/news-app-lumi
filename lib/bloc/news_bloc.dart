import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumi_news/bloc/news_events.dart';
import 'package:lumi_news/bloc/news_state.dart';
import 'package:lumi_news/repo/news_repo.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepo newsRepo;
  NewsBloc({required this.newsRepo}) : super(NewsInitial()) {
    final NewsRepo newsRepo = NewsRepo();

    on<NewsEvent>((event, emit) async {
      if (event is GetNewsData) {
        emit(NewsLoading());
        await Future.delayed(const Duration(seconds: 1));
        try {
          final mydata = await newsRepo.getDataLatest();
          emit(NewsLoaded(mydata));
        } catch (e) {
          emit(NewsError(e.toString()));
        }
      } else if (event is GetDataTrending) {
        emit(NewsLoading());
        await Future.delayed(const Duration(seconds: 1));
        try {
          final mydata = await newsRepo.getDataTrending();
          emit(NewsLoaded(mydata));
        } catch (e) {
          emit(NewsError(e.toString()));
        }
      } else if (event is GetDataNews) {
        emit(NewsLoading());
        await Future.delayed(const Duration(seconds: 1));
        try {
          final mydata = await newsRepo.getDataNews();
          emit(NewsLoaded(mydata));
        } catch (e) {
          emit(NewsError(e.toString()));
        }
      }
    });
  }
}
