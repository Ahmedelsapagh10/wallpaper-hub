import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels/Provider/search/repositorySearch.dart';
import 'package:pexels/Provider/search/webservicessearch.dart';
import 'package:pexels/controller/SearchCubit/searchCubit.dart';
import 'package:pexels/view/pages/homeScreen.dart';
import 'Provider/repository.dart';
import 'Provider/webServices.dart';
import 'controller/cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) =>
                ImagesCubit(ImagesRepositoy(webServices: WebServices())))),
        BlocProvider(
            create: ((context) => ImagesSearchCubit(ImagesSearchRepositoy(
                webServicesSearch: WebServicesSearch())))),
      ],
      child: MaterialApp(
        title: 'WallpaperHub',
        theme: ThemeData(
          backgroundColor: Colors.white,
          //  primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          brightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
       /*
          <uses-permission android:name="android.permission.INTERNET"/>
   <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
        */