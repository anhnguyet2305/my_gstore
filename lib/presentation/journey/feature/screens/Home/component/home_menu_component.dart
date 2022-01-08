import 'package:flutter/material.dart';
import 'package:my_gstore/common/constants/icon_constant.dart';
import 'package:my_gstore/common/customs/custom_gesturedetactor.dart';
import 'package:my_gstore/common/global_app_cache/global_app_catch.dart';
import 'package:my_gstore/common/theme/theme_color.dart';
import 'package:my_gstore/common/theme/theme_text.dart';
import 'package:my_gstore/common/ultils/format_utils.dart';

import '../../../../../injector_container.dart';

class HomeMenuComponent extends StatefulWidget {
  const HomeMenuComponent({Key? key}) : super(key: key);

  @override
  _HomeMenuComponentState createState() => _HomeMenuComponentState();
}

class _HomeMenuComponentState extends State<HomeMenuComponent> {
  @override
  Widget build(BuildContext context) {
    GlobalAppCache appCache = injector<GlobalAppCache>();
    final dataGst =
        appCache.splashDataModel?.splashBonusGSTModel?.toJson() ?? {};
    double currentValue = dataGst['CurrentValue'] ?? 0;
    double percentVolume = dataGst['PercentVolume'] ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
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
                borderColor: AppColors.logoSkyBlue,
                onTap: () {},
              ),
              _HomeMenuNewIcon(
                icon: Image.asset(
                  IconConst.home_center_education,
                  width: 26,
                  height: 26,
                ),
                label: 'Giáo dục',
                text: 'trực tuyến',
                borderColor: AppColors.realEstate,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Expanded(
                child: CustomGestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    height: 61.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.logoYellow,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          IconConst.charity_logo,
                          width: 30,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(TextSpan(children: [
                              const TextSpan(
                                text: 'G-FAMILY ',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: 'Averta',
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text: 'FOUNDATION',
                                style: AppTextTheme.normalBlack.copyWith(
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ])),
                            const SizedBox(height: 3),
                            const Divider(
                              height: 1,
                              color: AppColors.grey7,
                              endIndent: 16,
                              indent: 16,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${FormatUtils.formatCurrencyDoubleToString(appCache.splashDataModel?.splashCharityDataModel?.total ?? 0)} ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextTheme.medium.copyWith(
                                  color: AppColors.primaryColor, fontSize: 15),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Expanded(
                  child: CustomGestureDetector(
                onTap: () {},
                child: Container(
                  height: 61.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.logoGreen, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Điểm cống hiến lan tỏa',
                        style: TextStyle(
                            fontFamily: 'Averta',
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  Image.asset(
                                    IconConst.home_center_hand,
                                    width: 20,
                                    height: 15,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    FormatUtils.formatCurrencyDoubleToString(
                                        currentValue,
                                        haveUnit: false),
                                    style: AppTextTheme.smallGrey,
                                  )
                                ],
                              )),
                          Container(
                            width: 0.5,
                            height: 25,
                            color: AppColors.grey7,
                          ),
                          Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Image.asset(
                                    IconConst.home_center_chart,
                                    width: 20,
                                    height: 15,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${_formatDoubleToString(percentVolume)}%',
                                    style: AppTextTheme.smallGrey,
                                  )
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }

  String _formatDoubleToString(double input) {
    if (input >= 100) {
      return '100';
    }
    List<String> values = '$input'.split('.');
    if (values != null && values.length >= 1) {
      return '${values[0]},${values[1]}';
    }
    return input != 0 ? '$input' : '0';
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
