import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:pexels/controller/cubit.dart';
import 'package:pexels/controller/state.dart';
import 'package:pexels/models/categorie_model.dart';
import 'package:pexels/view/widgets/categoryList.dart';

import '../widgets/appBartitle.dart';
import '../widgets/categoty_widget.dart';
import '../widgets/imagesWidget.dart';
import '../widgets/searchfield.dart';
import 'searchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ImagesCubit>(context).getAllImages();

    // ImagesRepositoy imagesrepositoy =
    //     ImagesRepositoy(webServices: WebServices());
    // imagesrepositoy.getImages();

    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<CategorieModel> x = categories;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBartitle(context),
      body: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BodyBuildWidget(
              x: x,
              controller: controller,
            );
          } else {
            return NoInterNetConnection();
          }
        },
        child: BodyBuildWidget(controller: controller, x: x),
      ),
    );
  }

  Widget NoInterNetConnection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          //CircularProgressIndicator(color: Colors.grey),
          SizedBox(
            height: 20,
          ),
          Text(
            'No Internet',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}

class BodyBuildWidget extends StatelessWidget {
  const BodyBuildWidget({
    Key? key,
    required this.controller,
    required this.x,
  }) : super(key: key);

  final TextEditingController controller;
  final List<CategorieModel> x;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MediaQuery.of(context).orientation == Orientation.landscape
            ? Container()
            : search(
                controller: controller,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              SearchScreen(searchQuery: controller.text))));
                }),
        MediaQuery.of(context).orientation == Orientation.landscape
            ? Container()
            : category_widget(
                category: x,
              ),
        BlocBuilder<ImagesCubit, ImagesState>(
          builder: (context, state) {
            ImagesCubit controller = context.read<ImagesCubit>();
            return Flexible(
              child: Container(
                child: imagesWidget(
                  controller,
                  context,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
