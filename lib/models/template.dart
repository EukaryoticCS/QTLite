class Template {
  String title;
  String creator;

  Template({required this.title, required this.creator});

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(title: json["title"], creator: json["creator"]);
  }
}
