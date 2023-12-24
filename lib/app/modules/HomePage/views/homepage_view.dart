import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vyld/app/data/models/Container_Properties_model.dart';

import 'package:vyld/app/modules/HomePage/controller/homepage_controller.dart';
import 'package:vyld/app/modules/HomePage/local_widgets/page1.dart';
import 'package:vyld/app/modules/HomePage/local_widgets/page2.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            leadingWidth: 100,
            leading: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.back, size: 24, color: Color.fromARGB(255, 0, 76, 206)),
                Text(
                  "Account",
                  style: TextStyle(color: Color.fromARGB(255, 0, 76, 206), letterSpacing: 0.1, fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            title: const Text(
              "Transfer",
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              primary: true,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Who do you want to \ntransfer money to?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -1.0,
                        ),
                      ).marginAll(20.0),
                      Container(
                        height: 50,
                        width: 115,
                        decoration: BoxDecoration(
                          color: Colors.black87.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              "New",
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ).marginSymmetric(horizontal: 20.0)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: MediaQuery.of(context).size.height * 0.40,
                  color: Colors.white,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.delta.dx > 0) {
                        controller.pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
                      } else if (details.delta.dx < 0) {
                        controller.pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
                      }
                    },
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {},
                      controller: controller.pageController,
                      children: const [
                        PageView1(),
                        PageView2(),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Transform.translate(
                        offset: const Offset(-95, 0),
                        child: Stack(children: <Widget>[
                          Container(
                            width: 290,
                            height: 285,
                            decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(135),
                            ),
                          ),
                          Positioned(
                            bottom: 115,
                            left: 100,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SALARY",
                                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "\$12,475",
                                  style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.w800, letterSpacing: -3.5),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  "Drag to the person you want\nto transfer money",
                                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ).marginAll(20.0),
                          ),
                        ]),
                      ),
                      Transform.translate(
                        offset: const Offset(-65, -62.5),
                        child: Container(
                          height: 95,
                          width: 92.5,
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(44),
                          ),
                          child: const Center(
                              child: Text(
                            "View  All",
                            style: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: -1.0),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
