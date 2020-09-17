class Article {
  String title;
  String author;
  String source;
  String imageURL;
  String articleURL;
  String content;
  String description;
  DateTime publishedAt;

  Article(
      {this.title,
      this.author,
      this.source,
      this.imageURL,
      this.articleURL,
      this.description,
      this.content,
      this.publishedAt});
}
