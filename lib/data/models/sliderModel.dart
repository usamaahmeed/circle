class SliderModel {
  List<Slider> slider;
  int notificationCount;

  SliderModel({
    required this.slider,
    required this.notificationCount,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        slider:
            List<Slider>.from(json["slider"].map((x) => Slider.fromJson(x))),
        notificationCount: json["notification_count"],
      );

  Map<String, dynamic> toJson() => {
        "slider": List<dynamic>.from(slider.map((x) => x.toJson())),
        "notification_count": notificationCount,
      };
}

class Slider {
  int id;
  String image;
  int categoryId;
  int subCategoryId;

  Slider({
    required this.id,
    required this.image,
    required this.categoryId,
    required this.subCategoryId,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"],
        image: json["image"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
      };
}
