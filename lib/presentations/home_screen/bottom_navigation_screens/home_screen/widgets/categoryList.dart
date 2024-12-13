import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/categoryModel.dart';
import '../../../../../widgets/custom_text/custom_text.dart';
import '../../category_screen/provider/product_provider.dart';
import '../provider/category_provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
      if (categoryProvider.categories.isEmpty) {
        return const SizedBox.shrink();
      }
      return Container(
        height: 56,
        color: categoryBgColor,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            CategoryModel category = categoryProvider.categories[index];
            return GestureDetector(
              onTap: () {
                categoryProvider.selectCategory(index);
                categoryProvider.selectSubCategory(0);
                Provider.of<ProductProvider>(context, listen: false)
                    .fetchProductData(
                        null, category.id, category.subCategories[0].id);
              },
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: categoryProvider.selectedCategoryIndex == index
                        ? bottomColor
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      child: Image.network(
                        category.image,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    CustomText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      title: category.title,
                      fontSize: fontR12,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 4,
            );
          },
          itemCount: categoryProvider.categories.length,
        ),
      );
    });
  }
}
