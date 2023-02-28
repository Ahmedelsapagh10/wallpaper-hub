import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

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

  double? _progress;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                  clipBehavior: Clip.none,
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  )),

              ///
              ///
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width / 12),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _progress != null
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.3),
                            ),
                            onPressed: () async {
                              FileDownloader.downloadFile(
                                name: 'Pexels${DateTime.now()}.jpg',
                                url: widget.image.trim(),
                                onProgress: (fileName, progress) {
                                  setState(() {
                                    _progress = progress;
                                  });
                                },
                                onDownloadCompleted: (path) {
                                  print('path = $path');
                                  setState(() {
                                    _progress = null;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'image is saved to gallary')));
                                },
                              );
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
                        width: MediaQuery.of(context).size.width / 3,
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
    );
  }
}
