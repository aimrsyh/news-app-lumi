class NewsModel {
  final String imageUrl;
  final String link;
  final String newsTitle;
  final String publisherImageUrl;
  final String publisherName;
  final String publisherRectangleUrl;
  final String updated;

  NewsModel({
    required this.imageUrl,
    required this.link,
    required this.newsTitle,
    required this.publisherImageUrl,
    required this.publisherName,
    required this.publisherRectangleUrl,
    required this.updated,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        imageUrl: json['imageUrl'],
        link: json['link'],
        newsTitle: json['newsTitle'],
        publisherImageUrl: json['publisherImageUrl'],
        publisherName: json['publisherName'],
        publisherRectangleUrl: json['publisherRectangleUrl'],
        updated: json['updated']);
  }
}
