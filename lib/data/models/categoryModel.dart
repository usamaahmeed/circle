class CategoryModel {
  int id;
  String image;
  String title;
  List<CategoryModel> subCategories;
  DateTime createdAt;

  CategoryModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subCategories,
    required this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        subCategories: List<CategoryModel>.from(
            json["sub_categories"].map((x) => CategoryModel.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "sub_categories":
            List<dynamic>.from(subCategories.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
      };
}
