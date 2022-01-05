import 'package:flutter/material.dart';
import 'package:my_gstore/common/constants/icon_constant.dart';
import 'package:my_gstore/feature/screens/Cart/cart_screen.dart';
import 'package:my_gstore/feature/screens/news/news_screen.dart';
import 'package:my_gstore/feature/widgets/bottom_nagivation_widget.dart';
import 'package:my_gstore/feature/widgets/layout_contain_widget_keep_alive.dart';

import 'Home/home_screen.dart';
import 'category/category_screen.dart';
import 'individual/individual_screen.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigation(
        icons: const [
          IconConst.home,
          IconConst.category,
          IconConst.shopping_cart,
          IconConst.news,
          IconConst.user,
        ],
        tabViews: const [
          LayoutContainWidgetKeepAlive(child: HomeScreen()),
          LayoutContainWidgetKeepAlive(child: CategoriesScreen()),
          LayoutContainWidgetKeepAlive(child: CartScreen()),
          LayoutContainWidgetKeepAlive(child: NewsScreen()),
          LayoutContainWidgetKeepAlive(child: IndividualScreen()),
        ],
      ),
    );
  }
}
