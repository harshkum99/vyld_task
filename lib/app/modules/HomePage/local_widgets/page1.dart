import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vyld/app/data/models/Container_Properties_model.dart';
import 'package:vyld/app/themes/app_images.dart';

class PageView1 extends StatelessWidget {
  const PageView1({super.key});

  Widget build(BuildContext context) {
    final childHeight = MediaQuery.of(context).size.height * 0.40 / 2;
    List<Alignment> alignmentPositions = [
      Alignment.bottomCenter,
      Alignment.center,
      Alignment.topCenter,
      Alignment.bottomCenter,
      Alignment.center,
      Alignment.bottomCenter,
    ];
    List<ContainerProperties> containerProperties = [
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.33, childHeight), radius: 42.5, margin: const EdgeInsets.only(left: 20.0, right: 10.0, top: 70.0, bottom: 00.0), color: const Color.fromARGB(255, 0, 49, 134), image: const AssetImage(AppImages.femaleC)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.22, childHeight), radius: 25, margin: const EdgeInsets.only(left: 20.0, right: 5.0, top: 50.0, bottom: 60.0), color: const Color.fromARGB(255, 0, 49, 134), image: const AssetImage(AppImages.femaleB)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.45, childHeight), radius: 55.0, margin: const EdgeInsets.only(bottom: 10.0, top: 25.0, right: 20.0, left: 30.0), color: const Color(0xffFF7E51), count: 4, image: const AssetImage(AppImages.text)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.3, childHeight), radius: 30.0, margin: const EdgeInsets.only(bottom: 32.5, top: 62.5, right: 25, left: 20), color: const Color.fromARGB(255, 105, 149, 226), image: const AssetImage(AppImages.maleB)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.4, childHeight), radius: 45, margin: const EdgeInsets.only(bottom: 40.0, top: 20.0, right: 22.5, left: 22.5), color: const Color.fromARGB(255, 193, 174, 5), image: const AssetImage(AppImages.femaleA)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.3, childHeight), radius: 35.0, margin: const EdgeInsets.only(bottom: 15.0, top: 65.0, right: 15.0, left: 15.0), color: const Color.fromARGB(255, 250, 189, 210), image: const AssetImage(AppImages.maleA)),
    ];
    List<int> durations = [
      350,
      250,
      150
    ];
    return Wrap(
      spacing: 0, // gap between adjacent chips
      runSpacing: 0, // gap between lines
      children: List.generate(containerProperties.length, (index) {
        return Animate(
          effects: [
            SlideEffect(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: durations[index % durations.length]), //vary timing here for each
              begin: Offset(-5.0, 0.0),
              end: Offset(0.0, 0.0),
            ),
          ],
          child: Container(
            height: containerProperties[index].size.height,
            width: containerProperties[index].size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Align(
              alignment: alignmentPositions[index],
              child: Stack(children: [
                Container(
                  margin: containerProperties[index].margin,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(containerProperties[index].radius),
                    color: containerProperties[index].color,
                    image: DecorationImage(
                      image: containerProperties[index].image ?? const AssetImage(AppImages.maleC),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                containerProperties[index].count == 0
                    ? const SizedBox.shrink()
                    : Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          margin: containerProperties[index].margin,
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: containerProperties[index].color,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              containerProperties[index].count.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
              ]),
            ),
          ),
        );
      }),
    );
    // GridView.custom(
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       mainAxisSpacing: 1,
    //       crossAxisSpacing: 1,
    //       childAspectRatio: 0.80,
    //     ),
    //     childrenDelegate: SliverChildBuilderDelegate(
    //       (BuildContext context, int index) {
    //         return AspectRatio(
    //           aspectRatio: containerProperties[index].size.width / containerProperties[index].size.height,
    //           child: Container(
    //             decoration: const BoxDecoration(
    //               color: Colors.yellow,
    //             ),
    //             child: Align(
    //               alignment: alignmentPositions[index],
    //               child: Container(
    //                 height: containerProperties[index].size.height,
    //                 width: containerProperties[index].size.width,
    //                 margin: containerProperties[index].margin,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(containerProperties[index].radius),
    //                   color: Colors.red,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       },
    //       childCount: 6,
    //     ));
  }
}
