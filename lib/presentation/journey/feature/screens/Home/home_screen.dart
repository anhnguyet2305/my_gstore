import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gstore/common/model/items_model.dart';
import 'package:my_gstore/common/theme/theme_color.dart';
import 'package:my_gstore/common/theme/theme_text.dart';
import 'component/show_model_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 136,
            toolbarHeight: 90,
            floating: false,
            pinned: true,
            stretch: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Chào buổi sáng',
                      style: AppTextTheme.normalWhite,
                    ),
                    Text(
                      ', Hung Ho',
                      style: AppTextTheme.medium,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
// go to map screen
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.grey7,
                        ),
                        Text(
                          "Bạn muốn tìm gì ?",
                          style: AppTextTheme.normalGrey,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5)
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.green,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[StretchMode.zoomBackground],
              background: Image.asset(
                'assets/images/mock_top_back_ground_home.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // go to map screen
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.asset(
                              'assets/images/mock_map.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    Positioned(
                        left: MediaQuery.of(context).size.width * 1 / 3.5,
                        right: MediaQuery.of(context).size.width * 1 / 3.5,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
//go to map screen
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Tìm quanh tôi",
                                  style: AppTextTheme.normalGrey,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: AppColors.grey7,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 16),
                // ListCategories(),
                SizedBox(
                  height: 8.0,
                ),
                // SliderComponent(),
                SizedBox(
                  height: 8.0,
                ),
                // ListReputableStoreComponent(),
                SizedBox(
                  height: 8.0,
                ),
                // ListByALotComponent(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/banner_homepage.png',
                    width: double.infinity,
                  ),
                ),
                // ListFashion(),
                SizedBox(
                  height: 8.0,
                ),
                // ListCarRental(),
                SizedBox(
                  height: 8.0,
                ),
                // ListComputer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Gợi ý hôm nay',
                          style: AppTextTheme.mediumPink,
                        ),
                      ),
                      Container(
                        child: _buildList(ItemProduct.ListByALotComponent),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<ItemProduct> _listCart) {
    List<Widget> _widgets = [];
    for (var index = 0; index < _listCart.length; index++) {
      _widgets.add(_itemWidget(_listCart[index]));
    }
    return Wrap(
      spacing: 8.0,
      children: _widgets,
    );
  }

  Widget _itemWidget(ItemProduct model) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(bottom: 8.0),
      width: (MediaQuery.of(context).size.width - 32) / 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.grey4, width: 1)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        model.pathImage,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Row(
                        children: [
                          _showDiscount(model),
                          SizedBox(
                            width: 6.0,
                          ),
                          _showTick(model),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                        model.name,
                        style: AppTextTheme.normalRoboto,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.colorSun,
                          ),
                          Text(
                            model.rating.toString(),
                            style: AppTextTheme.style10pxGrey,
                          ),
                          Text('(${model.numberOfReviews.toString()})',
                              style: AppTextTheme.style10pxGrey),
                          Spacer(),
                          Icon(
                            Icons.timer,
                            color: AppColors.grey7,
                            size: 16,
                          ),
                          Text(' ${model.km.toString()}km',
                              style: AppTextTheme.style10pxGrey),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2.0),
                      height: 1,
                      color: AppColors.grey4,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                _showPriceSale(model),
                                Text('${model.price.toString()}đ',
                                    style: AppTextTheme.normalPink),
                              ],
                            ),
                          ),
                          ShowModelButton(),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showTick(ItemProduct model) {
    Widget child;
    if (model.medal == '') {
      child = SizedBox();
    } else {
      child = Image.asset(
        '${model.medal}',
        width: 32.0,
        height: 32.0,
      );
    }
    return child;
  }

  Widget _showDiscount(ItemProduct model) {
    Widget child;
    if (model.discount == '') {
      child = SizedBox();
    } else {
      child = Container(
        alignment: Alignment.center,
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffFF7A45),
              Color(0xffFF9C6E),
            ],
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text(
          '- ${model.discount}%',
          style: AppTextTheme.style10pxWhite,
        ),
      );
    }
    return child;
  }

  Widget _showPriceSale(ItemProduct model) {
    Widget child;
    if (model.discount == '') {
      child = SizedBox();
    } else {
      child = Text(
        'Còn ',
        style: AppTextTheme.normalGrey,
      );
    }
    return child;
  }
}
