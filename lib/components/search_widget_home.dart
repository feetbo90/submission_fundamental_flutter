import 'package:flutter/material.dart';

import '../data/provider/restaurants_provider.dart';

class SearchWidgetHome extends StatelessWidget {
  final RestaurantsProvider provider;
  const SearchWidgetHome({Key? key,  required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onChanged: (value) {
                if (value.length >= 3) {
                  provider.onSearch(value);
                } else if (value.isEmpty) {
                  provider.onSearch(value);
                }
              },
              decoration: const InputDecoration(
                  hintText: "restaurant or menu",
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10, top: 15)),
            )),
      );
  }
}
