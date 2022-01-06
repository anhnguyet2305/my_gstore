import 'package:flutter/material.dart';
import 'package:my_gstore/common/constants/icon_constant.dart';
import 'package:my_gstore/common/constants/key_save_data_local.dart';
import 'package:my_gstore/common/customs/custom_scaffold.dart';
import 'package:my_gstore/common/local/local_app.dart';
import 'package:my_gstore/common/navigation/route_names.dart';
import 'package:my_gstore/common/ultils/log_util.dart';
import 'package:my_gstore/presentation/routes.dart';

import '../../../injector_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initData();
    super.initState();
  }

  void _initData() async {
    String? dataProfile = injector<LocalApp>()
        .getStringSharePreference(KeySaveDataLocal.keySaveDataProfile);
    LOG.d('_initData: $dataProfile');
    await Future.delayed(Duration(seconds: 1));
    if (dataProfile?.isNotEmpty ?? false) {
      // injector<AppCache>().profileModel =
      //     ProfileModel.fromJson(json.decode(dataProfile!));
      // Routes.instance.navigateTo(RouteName.containerScreen);
      Routes.instance.navigateTo(RouteName.loginScreen);
    } else {
      Routes.instance.navigateTo(RouteName.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              IconConst.logo,
              width: 207,
              height: 207,
            )
          ],
        ),
      ),
    );
  }
}
