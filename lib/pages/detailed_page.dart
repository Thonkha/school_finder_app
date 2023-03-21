import 'package:school_finder_app/cubit/app_cubit_states.dart';
import 'package:school_finder_app/cubit/app_cubits.dart';
import 'package:school_finder_app/widgets/app_large_text.dart';
import 'package:school_finder_app/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;

      return Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/wall4.jpg"),
                              fit: BoxFit.cover)),
                    )),
                Positioned(
                    left: 10,
                    top: 50,
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.red),
                          child: IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    top: 320,
                    child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppLargeText(
                                  text: "\$" + detail.school.name,
                                  size: 20,
                                  color: Colors.black.withOpacity(0.8),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                AppText(
                                  text: "Maseru, Main South1",
                                  color: Colors.black54,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      Icons.star,
                                      color: index < gottenStars
                                          ? Color.fromARGB(255, 233, 172, 4)
                                          : Colors.black.withOpacity(0.2),
                                    );
                                  }),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                AppText(text: "motto"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                AppLargeText(
                                  text: "Description",
                                  size: 25,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                AppText(
                                    text:
                                        "The school is schooling again and again and again and again and again and again...."
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                              ],
                            ),
                          ],
                        )))
              ],
            )),
      );
    });
  }
}
