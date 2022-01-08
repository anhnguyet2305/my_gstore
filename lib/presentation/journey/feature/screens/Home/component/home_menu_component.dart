import 'package:flutter/material.dart';
import 'package:my_gstore/common/constants/icon_constant.dart';
import 'package:my_gstore/common/customs/custom_gesturedetactor.dart';
import 'package:my_gstore/common/theme/theme_color.dart';
import 'package:my_gstore/common/theme/theme_text.dart';

class HomeMenuComponent extends StatefulWidget {
  const HomeMenuComponent({Key? key}) : super(key: key);

  @override
  _HomeMenuComponentState createState() => _HomeMenuComponentState();
}

class _HomeMenuComponentState extends State<HomeMenuComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _HomeMenuNewIcon(
              borderColor: AppColors.logoPink,
              icon: Image.asset(
                IconConst.home_center_qr,
                width: 24,
                height: 24,
              ),
              label: 'Mã QR',
              text: 'giới thiệu',
              onTap: () {}),
          _HomeMenuNewIcon(
            icon: Image.asset(
              IconConst.home_center_gshop,
              width: 26,
              height: 20,
            ),
            label: 'G-SHOP',
            text: 'cửa hàng đa năng',
            borderColor: AppColors.logoYellow,
            fontSize: 6,
            onTap: () {},
          ),
          _HomeMenuNewIcon(
            icon: Image.asset(
              IconConst.home_center_share,
              width: 26,
              height: 26,
            ),
            label: 'Chia sẻ',
            text: 'đồ ăn',
            borderColor: AppColors.logoGreen,
            onTap: () {},
          ),
          _HomeMenuNewIcon(
            icon: Image.asset(
              IconConst.home_center_gift,
              width: 26,
              height: 26,
            ),
            label: 'Cho tặng',
            text: 'đồ cũ',
            borderColor: AppColors.logoYellow,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _HomeMenuNewIcon extends StatelessWidget {
  final Color borderColor;
  final Widget icon;
  final String label;
  final String text;
  final Function onTap;
  final double? fontSize;

  const _HomeMenuNewIcon(
      {Key? key,
      required this.borderColor,
      required this.icon,
      required this.label,
      required this.text,
      this.fontSize,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10)),
        width: 61,
        height: 61,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextTheme.smallGrey.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 10),
            ),
            Text(
              text,
              maxLines: 1,
              style: AppTextTheme.smallGrey.copyWith(
                fontSize: fontSize ?? 9,
                color: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
