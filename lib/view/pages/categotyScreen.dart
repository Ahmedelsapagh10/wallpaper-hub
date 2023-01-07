import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels/controller/SearchCubit/searchCubit.dart';
import 'package:pexels/controller/SearchCubit/searchState.dart';

import '../widgets/appBartitle.dart';
import '../widgets/itemView.dart';
import 'image_view.dart';

class CategotyScreen extends StatefulWidget {
  final String searchQuery;
  const CategotyScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<CategotyScreen> createState() => _CategotyScreenState();
}

class _CategotyScreenState extends State<CategotyScreen> {
  @override
  void initState() {
    BlocProvider.of<ImagesSearchCubit>(context)
        .getAllImages(searchQuery: widget.searchQuery);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBartitle(context),
      body: BlocBuilder<ImagesSearchCubit, ImagesSearchState>(
        builder: (context, state) {
          ImagesSearchCubit controller = context.read<ImagesSearchCubit>();
          return SingleChildScrollView(
            child: Column(children: [
              GridView.builder(
                itemCount: controller.images.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return imageView(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ImageView(
                                    image:
                                        controller.images[index].src.portrait,
                                  ))));
                    },
                    image: controller.images[index].src.portrait,
                    photographer: controller.images[index].photographer,
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 4
                      : 2,
                  crossAxisSpacing: 3,
                  childAspectRatio: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 1 / 1.5
                      : 1 / 2,
                  mainAxisSpacing: 3,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                IconButton(
                  onPressed: () {
                    controller.navigateToNextPage(
                        searchQuery: widget.searchQuery);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.navigateToNextPage(
                        searchQuery: widget.searchQuery);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                )
              ]),
            ]),
          );
        },
      ),
    );
  }
}
