import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vyld/app/data/models/Container_Properties_model.dart';

class PageView2 extends StatelessWidget {
  const PageView2({super.key});

  @override
  Widget build(BuildContext context) {
    final childHeight = MediaQuery.of(context).size.height * 0.40 / 2;
    List<Alignment> alignmentPositions = [
      Alignment.center,
      Alignment.bottomRight,
      Alignment.topCenter,
      Alignment.topCenter,
      Alignment.centerLeft,
      Alignment.topCenter,
    ];
    List<ContainerProperties> containerProperties = [
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.4, childHeight), radius: 55.0, margin: const EdgeInsets.only(bottom: 20.0, top: 15.0, left: 20.0, right: 00.0), color: const Color.fromARGB(255, 128, 97, 86)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.329, childHeight), radius: 37.5, margin: const EdgeInsets.only(bottom: 25.0, top: 50.0, left: 25.0, right: 15.0), color: const Color.fromARGB(255, 38, 90, 181)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.27, childHeight), radius: 32.5, margin: const EdgeInsets.only(bottom: 67.5, top: 27.5, right: 20.0, left: 12.5), color: const Color.fromARGB(255, 202, 188, 183)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.25, childHeight), radius: 25, margin: const EdgeInsets.only(left: 40.0, right: 0.0, top: 10.0, bottom: 100.0), color: const Color.fromARGB(255, 5, 90, 100)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.4, childHeight), radius: 50, margin: const EdgeInsets.only(bottom: 40.0, top: 10.0, left: 30.0, right: 10.0), color: const Color.fromARGB(255, 5, 90, 100)),
      ContainerProperties(size: Size(MediaQuery.of(context).size.width * 0.35, childHeight), radius: 40.0, margin: const EdgeInsets.only(bottom: 75.0, top: 0.0, left: 20.0, right: 25.0), color: const Color.fromARGB(255, 13, 162, 236)),
    ];
    return Wrap(
      spacing: 0, // gap between adjacent chips
      runSpacing: 0, // gap between lines
      children: List.generate(containerProperties.length, (index) {
        return Animate(
          effects: const [
            SlideEffect(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 300),
              begin: Offset(1.0, 0.0),
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
              child: Container(
                margin: containerProperties[index].margin,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(containerProperties[index].radius),
                  color: containerProperties[index].color,
                ),
              ),
            ),
          ),
        );
      }),
    );
    // GridView.custom(
    //     physics: const NeverScrollableScrollPhysics(),
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       mainAxisSpacing: 1,
    //       crossAxisSpacing: 1,
    //       childAspectRatio: 0.775,
    //     ),
    //     childrenDelegate: SliverChildBuilderDelegate((BuildContext context, int index) {
    //       return Container(
    //         height: containerProperties[index].size.height,
    //         width: containerProperties[index].size.width,
    //         decoration: const BoxDecoration(
    //           color: Colors.yellow,
    //         ),
    //         child: Align(
    //           alignment: alignmentPositions[index],
    //           child: Container(
    //             height: containerProperties[index].size.height,
    //             width: containerProperties[index].size.width,
    //             margin: containerProperties[index].margin,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(containerProperties[index].radius),
    //               color: Colors.red,
    //             ),
    //           ),
    //         ),
    //       );
    //     }, childCount: 6));
  }
}
