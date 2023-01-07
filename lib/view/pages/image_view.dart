import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class ImageView extends StatefulWidget {
  final String image;
  const ImageView({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive,
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  final screencontroller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Screenshot(
        controller: screencontroller,
        child: Scaffold(
          body: Container(
            child: Stack(
              fit: StackFit.expand,
              children: [
                myWidget(widget.image),

                ///
                ///
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width / 12),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.3),
                        ),
                        onPressed: () async {
                          final image2 = await screencontroller
                              .captureFromWidget(myWidget(widget.image));

                          if (image2 == null) return;
                          //     await saveImage(image);
                          await saveImage(image2).then((value) {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 1.6,
                          child: Column(
                            children: const [
                              Text(
                                'set Wallpaper',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'image will saved in gallary!',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.4),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          // height: 50,
                          width: MediaQuery.of(context).size.width / 3,
                          // decoration: BoxDecoration(
                          //     color: Colors.black.withOpacity(0.4),
                          //     borderRadius: BorderRadius.circular(
                          //       12,
                          //     )),
                          child: const Text(
                            'cancel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    final name = 'wallpaperHub_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }
}

Widget myWidget(String image) {
  return ClipRRect(
      clipBehavior: Clip.none,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ));
}
