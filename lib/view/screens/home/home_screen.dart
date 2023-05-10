import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture/view_model/category_vm.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../core/size_config.dart';
import '../../../main.dart';
import '../../../view_model/product_vm.dart';
import 'components/body.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductViewModel>(context, listen: false)
        .fetchProductsList();
    Provider.of<CategoryViewModel>(context, listen: false)
        .fetchCategoriesList();
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
        context, PageRouteBuilder(pageBuilder: (a, b, c) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: LiquidPullToRefresh(
          onRefresh: _handleRefresh,
          animSpeedFactor: 2,
          showChildOpacityTransition: false,
          color: Colors.white,
          backgroundColor: Colors.green,
          child: const HomeBody(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
          height: SizeConfig.defaultSize! * 2, //20
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/scan.svg",
            height: SizeConfig.defaultSize! * 2.4, //24
          ),
          onPressed: () {},
        ),
        const Center(
          child: Text(
            "Scan",
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
