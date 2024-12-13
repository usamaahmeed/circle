import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle/core/dimens/dimens.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/sliderModel.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<SliderProvider>(context, listen: false).fetchSliderData());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.width,
      child: Consumer<SliderProvider>(
        builder: (context, sliderProvider, child) {
          if (sliderProvider.sliderModel == null) {
            return const SizedBox.shrink();
          }
          SliderModel sliderModel = sliderProvider.sliderModel!;
          return CarouselSlider(
            options: CarouselOptions(
              height: 175.0,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayCurve: Curves.slowMiddle,
            ),
            items: sliderModel.slider.map(
              (slide) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: Dimens.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(slide.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
