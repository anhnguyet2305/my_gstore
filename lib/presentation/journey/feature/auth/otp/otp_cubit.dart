import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gstore/common/bloc/loading_bloc/loading_bloc.dart';
import 'package:my_gstore/common/bloc/loading_bloc/loading_event.dart';
import 'package:my_gstore/common/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:my_gstore/common/network/app_client.dart';
import 'package:my_gstore/common/network/app_header.dart';
import 'package:my_gstore/common/ultils/common_util.dart';

class OtpCubit extends Cubit<VerifyOtpState> {
  final SnackBarBloc snackBarBloc;
  final LoadingBloc loadingBloc;
  final AppClient appClient;

  OtpCubit(this.snackBarBloc, this.loadingBloc, this.appClient)
      : super(VerifyOtpInitState());

  Future<bool> verifyOtp(String phone, String otp) async {
    try {
      loadingBloc.add(StartLoading());
      final data = await appClient.get(
          'Customer/ValidateToken?phone=$phone&token=$otp&tokenDevice=123');
      AppHeader appHeader = AppHeader();
      final accessToken = data['Data']['Token'];
      appHeader.accessToken = accessToken;
      appClient.setHeader(appHeader);
      return true;
    } catch (e) {
      CommonUtils.handleException(snackBarBloc, e, methodName: 'verifyOtp');
    } finally {
      loadingBloc.add(FinishLoading());
    }
    return false;
  }
}

abstract class VerifyOtpState {}

class VerifyOtpInitState extends VerifyOtpState {}

class VerifyOtpGettingState extends VerifyOtpState {}

class VerifyOtpGotState extends VerifyOtpState {}

class VerifyOtpGetFailState extends VerifyOtpState {}
