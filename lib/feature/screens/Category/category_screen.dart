import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_gstore/common/theme/theme_color.dart';
import 'package:my_gstore/common/theme/theme_text.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _current = 0;
  final List<String> images = [
    'assets/images/img.png',
    'assets/images/img_1.png',
    'assets/images/img_2.png',
  ];

  List<Widget> generateImageTiles() {
    return images
        .map((element) => ClipRRect(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: Image.asset(
                  element,
                  fit: BoxFit.cover,
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                    items: generateImageTiles(),
                    options: CarouselOptions(
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(seconds: 3),
                        viewportFraction: 1,
                        autoPlay: true,
                        onPageChanged: (index, other) {
                          setState(() {
                            _current = index;
                          });
                        })),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_current + 1}/ ${images.length}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 7.0,
                  alignment: WrapAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 84.0,
                        height: 102.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              '',
                              width: 40.0,
                              height: 40.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Xã Hội',
                              textAlign: TextAlign.center,
                              style: AppTextTheme.normalGrey9,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemCategory() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 84.0,
        height: 102.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              '',
              width: 40.0,
              height: 40.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '',
              textAlign: TextAlign.center,
              style: AppTextTheme.normalGrey9,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
