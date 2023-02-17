import 'package:equatable/equatable.dart';
import 'package:lumi_news/model/news_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoaded extends NewsState {
  List<NewsModel> mydata;
  NewsLoaded(this.mydata);

  @override
  List<Object?> get props => [mydata];
}

class NewsError extends NewsState {
  final String error;

  NewsError(this.error);
  @override
  List<Object?> get props => [error];
}
