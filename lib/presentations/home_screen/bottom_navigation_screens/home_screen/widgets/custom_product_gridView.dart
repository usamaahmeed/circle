import 'package:circle/core/app_colors/app_colors.dart';
import 'package:circle/core/navigator/navigator.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/product_details.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/provider/last_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/productModel.dart';
import '../../../../../widgets/custom_text/custom_text.dart';

class CustomProductsGridView extends StatefulWidget {
  const CustomProductsGridView({
    super.key,
  });

  @override
  State<CustomProductsGridView> createState() => _CustomProductsGridViewState();
}

class _CustomProductsGridViewState extends State<CustomProductsGridView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<LastProductProvider>(context, listen: false)
            .fetchProductData());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LastProductProvider>(
        builder: (context, productProvider, child) {
      if (productProvider.products.isEmpty) {
        return const SizedBox.shrink();
      }
      return Container(
        height: 833,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
            mainAxisExtent: 196,
          ),
          itemCount: productProvider.products.length,
          itemBuilder: (BuildContext context, int index) {
            ProductModel product = productProvider.products[index];
            return GestureDetector(
              onTap: () {
                NavigatorHandler.push(ProductDetails(product: product));
              },
              child: Container(
                height: 191,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: inputBoxColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      height: 107,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: product.isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: favoriteColor,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: favoriteColor,
                                  ),
                            backgroundColor: categoryColor,
                          ),
                          Spacer(),
                          product.isOffer
                              ? Container(
                                  height: 19,
                                  width: 33,
                                  decoration: BoxDecoration(
                                    color: bottomColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: CustomText(
                                    fontColor: white,
                                    textAlign: TextAlign.center,
                                    title: '20%',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(product.image),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      textAlign: TextAlign.start,
                      title: product.title,
                      fontColor: textColor,
                      fontSize: 14,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 32,
                      child: Row(
                        children: [
                          CustomText(
                            title: product.priceWeightUnit.toString(),
                            fontColor: textColor,
                            fontSize: fontR17,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            title: 'ج.م',
                            fontColor: textColor,
                            fontSize: fontR12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CustomText(
                            isStrikethrough: true,
                            title: product.isOffer == true ? '300' : '',
                            fontColor: greyColor,
                            fontSize: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          CustomText(
                            isStrikethrough: true,
                            title: product.isOffer == true ? 'ج.م' : '',
                            fontColor: greyColor,
                            fontSize: 12,
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: bottomColor,
                            child: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
