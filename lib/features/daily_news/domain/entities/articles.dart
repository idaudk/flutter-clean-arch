import 'package:equatable/equatable.dart';

//entities are used by persentation layer of app
class ArticleEntity extends Equatable {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleEntity(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  @override
  List<Object?> get props {
    return [author, title, description, url, urlToImage, publishedAt, content];
  }
}
