import 'package:circle/core/constants/constants.dart';
import 'package:circle/core/navigator/navigator.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/categoryModel.dart';
import '../../../../../widgets/custom_text/custom_text.dart';
import '../provider/category_provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<CategoryProvider>(context, listen: false)
        .fetchCategoryData());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        if (categoryProvider.categories.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          height: 288,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 6,
              mainAxisSpacing: 10,
              mainAxisExtent: 142,
            ),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              CategoryModel category = categoryProvider.categories[index];

              return GestureDetector(
                onTap: () {
                  categoryProvider.selectCategory(index);
                  categoryProvider.selectSubCategory(0);
                  categoryProvider.getId(
                      category.id, category.subCategories[0].id);
                  NavigatorHandler.push(ProductsScreen());
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          // color: inputBoxColor,
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
                        width: 66,
                        child: CustomText(
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          fontSize: fontR12,
                          title: category.title,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
