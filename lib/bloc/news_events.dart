import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  List<Object?> get props => [];
}

class GetNewsData extends NewsEvent {
  GetNewsData();
}

class GetDataTrending extends NewsEvent {}

class GetDataNews extends NewsEvent {}
