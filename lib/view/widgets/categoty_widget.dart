import 'package:flutter/material.dart';

import 'package:pexels/view/pages/categotyScreen.dart';

import '../../models/categorie_model.dart';

class category_widget extends StatefulWidget {
  const category_widget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final List<CategorieModel> category;

  @override
  State<category_widget> createState() => _category_widgetState();
}

class _category_widgetState extends State<category_widget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.category.length,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return category_items(
            category: widget.category[index],
            searchKey: widget.category[index].categorieName,
          );
        }),
      ),
    );
  }
}

class category_items extends StatelessWidget {
  final String searchKey;
  const category_items({
    Key? key,
    required this.searchKey,
    required this.category,
  }) : super(key: key);

  final CategorieModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => CategotyScreen(
                      searchQuery: category.categorieName,
                    ))));
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                category.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.4),
              ),
              child: Text(
                category.categorieName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
