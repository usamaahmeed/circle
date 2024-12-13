import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/categoryModel.dart';
import '../../../../../widgets/custom_text/custom_text.dart';
import '../../category_screen/provider/product_provider.dart';

class SubCategoryList extends StatelessWidget {
  const SubCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, provider, _) {
      return Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              CategoryModel category =
                  provider.categories[provider.selectedCategoryIndex];
              CategoryModel subCategory = category.subCategories[index];
              return GestureDetector(
                onTap: () {
                  provider.selectSubCategory(index);
                  provider.getId(category.id, subCategory.id);
                  Provider.of<ProductProvider>(context, listen: false)
                      .fetchProductData(null, category.id, subCategory.id);
                },
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: index == provider.selectedSubCategoryIndex
                        ? bottomColor
                        : categoryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CustomText(
                    fontColor: index == provider.selectedSubCategoryIndex
                        ? white
                        : textColor,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    title: subCategory.title,
                    fontSize: fontR12,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 8,
              );
            },
            itemCount: provider.categories[provider.selectedCategoryIndex]
                .subCategories.length),
      );
    });
  }
}
