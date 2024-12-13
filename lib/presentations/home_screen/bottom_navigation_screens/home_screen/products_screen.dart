import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/provider/category_provider.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/categoryList.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/custom_products_gridView.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/subCategoryList.dart';
import 'package:circle/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:circle/widgets/custom_box_shadow/custom_box_shadow.dart';
import 'package:circle/widgets/custom_search/custom_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors/app_colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    super.key,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        showToolBar: true,
        title: 'Products'.tr(),
        showBackArrow: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomSearchField(
              controller: searchController,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          CategoryList(),
          SizedBox(
            height: 8,
          ),
          SubCategoryList(),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<CategoryProvider>(
                builder: (context, provider, _) {
                  return CustomProductGridView(
                    categoryId: provider.categoryId,
                    subCategoryId: provider.subCategoryId,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomBoxShadow(),
        ],
      ),
    );
  }
}
