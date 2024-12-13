import 'package:circle/core/app_colors/app_colors.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/provider/user_provider.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/category_widget.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/custom_home_row.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/custom_product_gridView.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/widgets/slider_widget.dart';
import 'package:circle/presentations/home_screen/provider/layout_provider.dart';
import 'package:circle/widgets/custom_svg/CustomSvg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../../../widgets/custom_app_bar_icom=n/custom_app_bar_icon.dart';
import '../../../../widgets/custom_box_shadow/custom_box_shadow.dart';
import '../../../../widgets/custom_search/custom_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              final firstName = userProvider.user?.user.firstName ?? '';
              final lastName = userProvider.user?.user.lastName ?? '';
              final fullName = '$firstName $lastName';
              return CustomAppBar(
                showToolBar: true,
                isColum: true,
                title: fullName,
                title2: 'hello'.tr(),
                loadingWidth: 32,
                leading: CustomSvg(
                  assetName: 'homeIcon',
                ),
                actions: [
                  CustomAppBarIcon(
                      icon: Icon(
                        Icons.notifications,
                      ),
                      onPressed: () {}),
                  CustomAppBarIcon(
                    icon: Icon(Icons.shopping_cart_sharp),
                    color: black,
                    onPressed: () {},
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                CustomSearchField(
                  controller: searchController,
                  onlyRead: true,
                ),
                SizedBox(
                  height: 16,
                ),
                SliderWidget(),
                SizedBox(
                  height: 32,
                ),
                Consumer<LayoutProvider>(builder: (context, provider, _) {
                  return CustomHomeRow(
                    title: 'Sections',
                    onTap: () {
                      provider.updateSelectedBottomNavigationIndex(1);
                    },
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                CategoryWidget(),
                SizedBox(
                  height: 16,
                ),
                CustomHomeRow(
                  title: 'Latest Products',
                  onTap: () {},
                ),
                SizedBox(
                  height: 36,
                ),
                CustomProductsGridView(),
                CustomBoxShadow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
