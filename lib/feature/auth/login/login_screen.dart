import 'package:flutter/material.dart';
import 'package:my_gstore/common/constants/icon_constant.dart';
import 'package:my_gstore/common/customs/custom_scaffold.dart';
import 'package:my_gstore/common/navigation/route_names.dart';
import 'package:my_gstore/common/theme/theme_color.dart';
import 'package:my_gstore/common/theme/theme_text.dart';
import 'package:my_gstore/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 1 / 6,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'G-Store',
            style: AppTextTheme.bigTitle,
          ),
          Text(
            'Tech company',
            style: AppTextTheme.normalGrey,
          ),
          SizedBox(
            height: 16.0,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Routes.instance.navigateTo(RouteName.loginWithPhoneNumber);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.logoGreen,
                  borderRadius: BorderRadius.circular(8.0)),
              height: 48.0,
              margin: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    IconConst.phone,
                    width: 22.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Đăng nhập bằng số điện thoại',
                    style: AppTextTheme.medium,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
