import 'package:school_finder_app/cubit/app_cubit_states.dart';
import 'package:school_finder_app/cubit/app_cubits.dart';
import 'package:school_finder_app/widgets/app_large_text.dart';
import 'package:school_finder_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List exploreItems = ["Academics", "Sports", "Fees", "Competitions"];
  List schools = ["hope.jpg", "thetsane.png", "mabathoana.jpg"];
  List exploreItemsImg = [
    "academic.jpg",
    "sports.jpg",
    "fees.jpg",
    "competition.jpg",
  ];

  int currentIndex = 0;
  /*void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }*/

  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
        if (state is LoadedState) {
          var info = state.schools;
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(children: [
                    Icon(Icons.menu, size: 30, color: Colors.black),
                    Expanded(child: Container()),
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.withOpacity(0.5)),
                    )
                  ]),
                ),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: AppLargeText(
                    text: "Discover",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(text: "Schools"),
                        Tab(text: "Rankings"),
                        Tab(text: "Events")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .detailPage(info[index]);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("images/" + schools[index]),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          );
                        }),
                    Text("There"),
                    Text("Bye")
                  ]),
                ),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: "Explore More", size: 22),
                      AppText(text: "See All", color: Colors.blue, size: 20)
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    height: 80,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 40),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "images/" + exploreItemsImg[index]),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  child: AppText(
                                      text: exploreItems[index],
                                      color: Colors.red),
                                )
                              ]));
                        })),
              ]);
        } else {
          return Container();
        }
      },
    ));
  }
}
