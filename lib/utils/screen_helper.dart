import 'package:flutter/material.dart';

class ScreenHelper extends StatelessWidget {
  const ScreenHelper({this.desktop, this.mobile, this.tablet, Key? key})
      : super(key: key);

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800.0;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800.0 &&
      MediaQuery.of(context).size.width < 1200.0;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200.0) {
          return desktop!;
        } else if (constraints.maxWidth >= 800 &&
            constraints.maxWidth < 1200.0) {
          return tablet!;
        } else {
          return mobile!;
        }
      },
    );
  }
}
