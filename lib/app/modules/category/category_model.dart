class Category {
  String imageUrl;
  String name;
  String id;

  Category({required this.imageUrl, required this.name, required this.id});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        imageUrl: json['imageUrl'], name: json['name'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    return data;
  }
}
