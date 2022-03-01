import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class Carousel extends StatelessWidget {
   Carousel({Key? key}) : super(key: key);

  late CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return Container(
        height: carouselContainerHeight,
        color: Colors.yellow,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  viewportFraction: 1,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  height: carouselContainerHeight,
                ),
                items: List.generate(
                  5,
                  (index) => Builder(
                    builder: (context) {
                      return Container(
                        constraints: BoxConstraints(
                          minHeight: carouselContainerHeight,
                        ),
                      );
                    },
                  ),
                ).toList(),
              ),
            )
          ],
        ));
  }
}
