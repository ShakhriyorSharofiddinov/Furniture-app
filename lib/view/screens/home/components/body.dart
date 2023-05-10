import 'package:flutter/material.dart';
import 'package:furniture/view_model/category_vm.dart';
import 'package:provider/provider.dart';

import '../../../../core/api_response.dart';
import '../../../../core/size_config.dart';
import '../../../../view_model/product_vm.dart';
import '../../../widgets/title_text.dart';
import 'categories.dart';
import 'recommond_products.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize! * 2), //20
              child: const TitleText(
                title: "Browse by Categories",
              ),
            ),
            Consumer<CategoryViewModel>(builder: (context, data, child) {
              if (data.response.status == Status.COMPLETED) {
                return Categories(categories: data.categories,);
              }
              if (data.response.status == Status.ERROR) {
                return Center(child: Text(data.response.message ?? "ERROR"));
              }
              return Center(
                  child: Image.asset(
                "assets/loader.gif",
                height: 300,
              ));
            }),
            const Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: const TitleText(title: "Recommands For You"),
            ),
            Consumer<ProductViewModel>(builder: (context, data, child) {
              if (data.response.status == Status.COMPLETED) {
                return RecommandProducts(products: data.products);
              }
              if (data.response.status == Status.ERROR) {
                return Center(child: Text(data.response.message ?? "ERROR"));
              }
              return Center(
                  child: Image.asset(
                "assets/loader.gif",
                height: 300,
              ));
            }),
          ],
        ),
      ),
    );
  }
}
