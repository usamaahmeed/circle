import 'package:circle/data/models/productModel.dart';
import 'package:circle/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:circle/widgets/custom_text/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/constants/constants.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        showToolBar: true,
        title: 'Product Details'.tr(),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Center(
              child: Container(
                height: 234,
                child: Image.network(
                  product.image,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                CustomText(
                  title: product.title,
                  fontSize: fontR18,
                  fontWeight: FontWeight.bold,
                  fontColor: bottomColor,
                ),
                Spacer(),
                Container(
                  height: 43,
                  width: 43,
                  child: product.isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: favoriteColor,
                          size: 30,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: favoriteColor,
                          size: 30,
                        ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            CustomText(
              title: product.details,
              fontSize: fontR14,
              fontColor: greyColor,
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 136,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                color: inputBoxColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Container(
                    height: 52,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.local_offer_outlined,
                              color: bottomColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              title: 'Price'.tr() + ' :',
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        CustomText(
                          title: product.price.toString(),
                          fontColor: bottomColor,
                          fontSize: fontR24,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          title: 'EGP'.tr(),
                          fontColor: bottomColor,
                          fontSize: fontR12,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.minus,
                              color: textColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 199,
                          height: 48,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: CustomText(
                              title: '1',
                              fontSize: fontR17,
                              fontWeight: FontWeight.bold,
                              fontColor: textColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.add,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
