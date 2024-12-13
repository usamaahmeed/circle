import 'package:circle/core/app_colors/app_colors.dart';
import 'package:circle/core/navigator/navigator.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/products_screen.dart';
import 'package:circle/widgets/custom_text/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../data/models/categoryModel.dart';
import '../../../../widgets/custom_app_bar/custom_app_bar.dart';
import '../home_screen/provider/category_provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<CategoryProvider>(context, listen: false)
        .fetchCategoryData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        showToolBar: true,
        title: 'Categories'.tr(),
      ),
      body: Consumer<CategoryProvider>(
          builder: (context, categoryProvider, child) {
        if (categoryProvider.categories.isEmpty) {
          return const SizedBox.shrink();
        }

        return Row(
          children: [
            Container(
              width: 102,
              padding: const EdgeInsets.only(right: 16, left: 8, top: 8),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  CategoryModel category = categoryProvider.categories[index];

                  return GestureDetector(
                    onTap: () {
                      categoryProvider.selectCategory(index);
                    },
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: categoryProvider.selectedCategoryIndex == index
                            ? categoryBgColor
                            : Colors.transparent,
                        border: Border.all(
                          color: categoryProvider.selectedCategoryIndex == index
                              ? bottomColor
                              : Colors.transparent,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                image: NetworkImage(category.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 62,
                            child: CustomText(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              title: category.title,
                              fontSize: fontR14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: categoryProvider.categories.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 4,
                  );
                },
              ),
            ),
            Container(
              width: Dimens.width - 102,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  CategoryModel category = categoryProvider
                      .categories[categoryProvider.selectedCategoryIndex];
                  CategoryModel subCategory = category.subCategories[index];
                  return GestureDetector(
                    onTap: () {
                      categoryProvider.selectSubCategory(index);
                      categoryProvider.getId(category.id, subCategory.id);
                      NavigatorHandler.push(ProductsScreen());
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: categoryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: CustomText(
                        title: subCategory.title,
                        fontSize: fontR14,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: categoryProvider
                    .categories[categoryProvider.selectedCategoryIndex]
                    .subCategories
                    .length,
              ),
            ),
          ],
        );
      }),
    );
  }
}
