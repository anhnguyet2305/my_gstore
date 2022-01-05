import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_gstore/common/theme/theme_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var OnBoardingListBody = [
    'Tham gia cộng đồng G-STORE để giao lưu, chia sẻ và nhận các thông báo về tin tức kinh tế, thị trường trao đổi mua bán hàng hóa, dịch vụ.',
    'Đắm chìm vào các dịch vụ giải trí chất lượng được cộng đồng chọn lọc chia sẻ.',
    'Cùng nhau chia sẻ, trao tặng những giá trị của cuộc sống, từ hàng hóa, các dịch vụ mua sắm, trải nghiệm',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1.2 / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 82.0,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'G-STORE',
                    style: AppTextTheme.medium20PxBlack,
                  ),
                  Text(
                    'Tech company',
                    style: AppTextTheme.smallGrey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 3.4 / 5,
              child: IntroductionScreen(
                showDoneButton: true,
                showNextButton: true,
                showSkipButton: false,
                next: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Next', style: TextStyle(fontSize: 14.0)),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                done: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Done ',
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                onDone: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                },
                onSkip: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                },
                pages: [
                  PageViewModel(
                    useScrollView: true,
                    decoration:
                        PageDecoration(titleTextStyle: TextStyle(height: 0)),
                    image: Image.asset(
                        'assets/images/on_boarding/illustrate_new.png'),
                    titleWidget: Text(
                      OnBoardingListBody[0],
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.normalGrey,
                    ),
                    body: '',
                  ),
                  PageViewModel(
                    useScrollView: true,
                    image: Image.asset(
                        'assets/images/on_boarding/illustrate_music.png'),
                    titleWidget: Text(
                      OnBoardingListBody[1],
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.normalGrey,
                    ),
                    body: '',
                  ),
                  PageViewModel(
                    useScrollView: true,
                    image: Image.asset(
                        'assets/images/on_boarding/illustrate_shopping.png'),
                    titleWidget: Text(
                      OnBoardingListBody[2],
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.normalGrey,
                    ),
                    body: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
