import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/pages/home/components/carousel_items.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

// ignore: must_be_immutable
class Carousel extends StatelessWidget {
  Carousel({Key? key}) : super(key: key);

  CarouselController? carouselController;

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return SizedBox(
        height: carouselContainerHeight,
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
                        child: ScreenHelper(
                          //Responsive views
                          desktop: _buildDesktop(
                              context,
                              carouselItems[index].text!,
                              carouselItems[index].image!),
                          tablet: _buildTablet(
                              context,
                              carouselItems[index].text!,
                              carouselItems[index].image!),
                          mobile: _buildMobile(
                              context,
                              carouselItems[index].text!,
                              carouselItems[index].image!),
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

//Big screens
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 1000.0,
      minWidth: 1000.0,
      defaultScale: false,
      child: Row(
        children: [Expanded(child: text), Expanded(child: image)],
      ),
    ),
  );
}

//Mid screens
Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 760.0,
      minWidth: 760.0,
      defaultScale: false,
      child: Row(
        children: [Expanded(child: text), Expanded(child: image)],
      ),
    ),
  );
}

//Small screens
Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints:
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .8),
    width: double.infinity,
    child: text,
  );
}
