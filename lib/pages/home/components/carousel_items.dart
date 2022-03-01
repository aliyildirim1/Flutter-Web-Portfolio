import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/utils/constants.dart';

List<CarouselItemModel> carouselItems = List.generate(
    5,
    (index) => CarouselItemModel(
          text: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "FLUTTER DEVELOPER",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 18.0),
                Text(
                  "MUHAMMED ALI\nYILDIRIM",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 10.0),
               const Text(
                  "Full-stack developer, based in Istanbul",
                  style: TextStyle(color: kCaptionColor,
                  fontSize: 15.0,
                  height: 1.0),
                ),
                  // const SizedBox(height: 10.0),
              ],
            ),
          ),
          image: Container(
              child: Image.asset(
            "assets/image/profile.JPG",
            fit: BoxFit.contain,
          )),
        ));
