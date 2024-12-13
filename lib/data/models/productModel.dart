class ProductModel {
  num id;
  String title;
  String image;
  num categoryId;
  Category category;
  num subCategoryId;
  Category subCategory;
  String details;
  dynamic salesLimit;
  num price;
  String unit;
  num weightUnit;
  num priceWeightUnit;
  bool isOffer;
  num isActive;
  dynamic offerType;
  num offerValue;
  DateTime offerStartDate;
  DateTime offerEndDate;
  num oldPrice;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.categoryId,
    required this.category,
    required this.subCategoryId,
    required this.subCategory,
    required this.details,
    required this.salesLimit,
    required this.price,
    required this.unit,
    required this.weightUnit,
    required this.priceWeightUnit,
    required this.isOffer,
    required this.isActive,
    required this.offerType,
    required this.offerValue,
    required this.offerStartDate,
    required this.offerEndDate,
    required this.oldPrice,
    required this.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        categoryId: json["category_id"],
        category: Category.fromJson(json["category"]),
        subCategoryId: json["sub_category_id"],
        subCategory: Category.fromJson(json["sub_category"]),
        details: json["details"],
        salesLimit: json["sales_limit"],
        price: json["price"],
        unit: json["unit"],
        weightUnit: json["weight_unit"],
        priceWeightUnit: json["price_weight_unit"],
        isOffer: json["is_offer"],
        isActive: json["is_active"],
        offerType: json["offer_type"],
        offerValue: json["offer_value"],
        offerStartDate: DateTime.parse(json["offer_start_date"]),
        offerEndDate: DateTime.parse(json["offer_end_date"]),
        oldPrice: json["old_price"],
        isFavorite: json["is_favorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "category_id": categoryId,
        "category": category.toJson(),
        "sub_category_id": subCategoryId,
        "sub_category": subCategory.toJson(),
        "details": details,
        "sales_limit": salesLimit,
        "price": price,
        "unit": unit,
        "weight_unit": weightUnit,
        "price_weight_unit": priceWeightUnit,
        "is_offer": isOffer,
        "is_active": isActive,
        "offer_type": offerType,
        "offer_value": offerValue,
        "offer_start_date":
            "${offerStartDate.year.toString().padLeft(4, '0')}-${offerStartDate.month.toString().padLeft(2, '0')}-${offerStartDate.day.toString().padLeft(2, '0')}",
        "offer_end_date":
            "${offerEndDate.year.toString().padLeft(4, '0')}-${offerEndDate.month.toString().padLeft(2, '0')}-${offerEndDate.day.toString().padLeft(2, '0')}",
        "old_price": oldPrice,
        "is_favorite": isFavorite,
      };
}

class Category {
  int id;
  String image;
  String title;
  List<Category> subCategories;
  DateTime createdAt;

  Category({
    required this.id,
    required this.image,
    required this.title,
    required this.subCategories,
    required this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        subCategories: List<Category>.from(
            json["sub_categories"].map((x) => Category.fromJson(x))),
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
