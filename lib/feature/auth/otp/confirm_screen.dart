import 'package:flutter/material.dart';
import 'package:my_gstore/common/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:my_gstore/common/bloc/snackbar_bloc/snackbar_event.dart';
import 'package:my_gstore/common/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:my_gstore/common/constants/icon_constant.dart';
import 'package:my_gstore/common/theme/theme_color.dart';
import 'package:my_gstore/common/theme/theme_text.dart';
import 'package:my_gstore/feature/screens/screen_container.dart';
import 'package:my_gstore/feature/widgets/button_component_icon.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../routes.dart';
import '../../injector_container.dart';
import 'otp_cubit.dart';

class ConfirmScreen extends StatefulWidget {
  final String phoneNumber;

  const ConfirmScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  String _otp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Routes.instance.pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: AppColors.grey4,
                      borderRadius: BorderRadius.circular(50.0)),
                  width: 38.0,
                  height: 38.0,
                  child: Image.asset(
                    IconConst.back,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nhập mã xác nhận',
                    style: AppTextTheme.title,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    'Bạn không nhận được mã xác nhận đăng nhập?',
                    style: AppTextTheme.normalGrey,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  GestureDetector(
                    child: const Text(
                      'Gửi mã xác nhận mới.',
                      style: AppTextTheme.normalLinkGreen,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                cursorColor: AppColors.grey4,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 56,
                  fieldWidth: (MediaQuery.of(context).size.width - 64) / 6,
                  selectedColor: AppColors.grey4,
                  activeColor: AppColors.grey4,
                  errorBorderColor: Colors.red,
                  inactiveColor: AppColors.grey4,
                ),
                animationDuration: Duration(milliseconds: 300),
                onChanged: (value) {
                  _otp = value;
                  // if(_otp.length==4){
                  //
                  // }
                  setState(() {});
                },
                appContext: context,
              ),
              const Spacer(),
              ButtonWidget(
                  onPressed: () async {
                    if (_otp.length == 6) {
                      final success = await injector<OtpCubit>()
                          .verifyOtp(widget.phoneNumber, _otp);
                      if (success) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContainerScreen(),
                          ),
                        );
                      }
                    } else {
                      injector<SnackBarBloc>().add(ShowSnackbarEvent(
                        content: 'Lỗiiiiiiiiiii',
                        type: SnackBarType.warning,
                      ));
                    }
                  },
                  buttonTitle: 'Đăng nhập',
                  backGrButton: AppColors.logoGreen),
            ],
          ),
        ),
      ),
    );
  }
}
