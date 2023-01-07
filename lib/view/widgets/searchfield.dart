import 'package:flutter/material.dart';

class search extends StatelessWidget {
  final Function()? onTap;
  final TextEditingController? controller;
  const search({
    Key? key,
    this.onTap,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.width / 8,
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.bottom,
          cursorHeight: 25,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.search,
                color: Colors.black87,
              ),
            ),
            hintText: 'search',
            hintStyle: const TextStyle(
              color: Colors.black45,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
