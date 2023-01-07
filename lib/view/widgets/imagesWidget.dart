import 'package:flutter/material.dart';

import '../../controller/cubit.dart';
import '../pages/image_view.dart';
import 'itemView.dart';

Widget imagesWidget(
  ImagesCubit controller,
  BuildContext context,
) {
  return SingleChildScrollView(
    child: Column(children: [
      GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.images.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          if (index == controller.images.length) {
            return Container(
              height: 100,
              color: Colors.blue,
              width: 200,
            );
          }
          return imageView(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ImageView(
                            image: controller.images[index].src.portrait,
                          ))));
            },
            image: controller.images[index].src.portrait,
            photographer: controller.images[index].photographer,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 4
                  : 2,
          crossAxisSpacing: 3,
          childAspectRatio:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 1 / 1.5
                  : 1 / 2,
          mainAxisSpacing: 3,
        ),
      ),
      Container(
        // color: Colors.red,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () {
              controller.navigateToPrePage();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.navigateToNextPage();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          )
        ]),
      )
    ]),
  );
}
