// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Article {
  final String title;
  final String url;
  final String imageUrl;
  final String summary;
  final String publishedAt;
  final String updatedAt;

  Article(this.title, this.url, this.imageUrl, this.summary, this.publishedAt,
      this.updatedAt);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'url': url,
      'image_url': imageUrl,
      'summary': summary,
      'publishedAt': publishedAt,
      'updatedAt': updatedAt,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      map['title'] as String,
      map['url'] as String,
      map['image_url'] as String,
      map['summary'] as String,
      map['published_at'] as String,
      map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source) as Map<String, dynamic>);
}
