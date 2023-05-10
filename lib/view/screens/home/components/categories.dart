import 'package:flutter/material.dart';

import '../../../../models/category.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key,required this.categories}) : super(key: key);

  final List<CategoryModel?> categories;

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