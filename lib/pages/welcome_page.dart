import 'package:school_finder_app/cubit/app_cubits.dart';
import 'package:school_finder_app/nav_pages/main_page.dart';
import 'package:school_finder_app/widgets/app_large_text.dart';
import 'package:school_finder_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_text.dart';

void main() {
  runApp(WelcomePage());
}

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  // This widget is the root of your application.
  List images = [
    "wall7.jpg",
    "wall9.jpg",
    "wall6.jpg",
  ];
  List headings = ["Welcome", "Tools Used", "Recommendations"];
  List subHeadings = [
    "Big Data Driven Smart School Finder",
    "Big Data Analysis tools",
    "School Recommendation Engine"
  ];
  List details = [
    "The process of finding the best school is simplified by bringing all the necessary information to you",
    "We analyse data using machine learning models to provide highly analyzed information to our clients",
    "School recommendation engine is built to help to recommend the best school that meets your desired attributes"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/" + images[index],
                    ),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(),
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: headings[index],
                          color: Color.fromARGB(255, 19, 221, 4),
                          size: 35,
                        ),
                        AppText(
                          text: subHeadings[index],
                          color: Color.fromARGB(255, 5, 94, 220),
                          size: 20,
                        ),
                        Container(
                          width: 250,
                          margin: const EdgeInsets.only(top: 20),
                          child: AppText(
                            text: details[index],
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.only(left: 3),
                            child: Row(
                              children: [
                                ResponsiveButton(width: 120,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? Color.fromARGB(255, 31, 244, 7)
                                  : Color.fromARGB(255, 11, 103, 3)),
                        );
                      }),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
