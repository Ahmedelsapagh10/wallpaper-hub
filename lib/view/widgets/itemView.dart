import 'package:flutter/material.dart';

class imageView extends StatelessWidget {
  final String image;
  final Function()? onTap;
  final String photographer;
  const imageView({
    Key? key,
    required this.image,
    this.onTap,
    required this.photographer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //  color: Colors.red,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 14,
                        backgroundImage: NetworkImage(image),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        photographer,
                        style: const TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.clip,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
//Row(
  //           children: [
  //             CircleAvatar(
  //               backgroundImage: NetworkImage(image),
  //             ),
  //             Text('Ahmed'),
  //           ],
  //         )