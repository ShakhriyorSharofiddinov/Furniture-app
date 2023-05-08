import 'package:flutter/material.dart';

import '../../../models/Categories.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories(this.categories,{Key? key}) : super(key: key);

  final List<Category?> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            categories[index]!,
          ),
        ),
      ),
    );
  }
}