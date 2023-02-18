import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  List<Object?> get props => [];
}

class GetDataLatest extends NewsEvent {
  GetDataLatest();
}

class GetDataTrending extends NewsEvent {}

class GetDataNews extends NewsEvent {}
