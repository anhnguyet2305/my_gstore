import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:my_gstore/common/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:my_gstore/common/bloc/snackbar_bloc/snackbar_event.dart';
import 'package:my_gstore/common/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:my_gstore/common/exception/app_exception.dart';
import 'package:my_gstore/common/exception/connect_exception.dart';
import 'package:my_gstore/common/exception/timeout_exception.dart';
import 'package:my_gstore/common/exception/token_expired_exception.dart';
import 'package:my_gstore/common/navigation/route_names.dart';
import 'package:my_gstore/common/network/app_client.dart';
import 'package:my_gstore/presentation/injector_container.dart';

import '../../presentation/routes.dart';
import 'log_util.dart';

class CommonUtils {
  static void handleException(SnackBarBloc? snackBarBloc, e,
      {required String methodName,
      String? exceptionName,
      bool showSnackbar = true,
      bool logBug = true,
      String? text}) async {
    LOG.e('GstoreException: ${e.toString()} | $methodName | $exceptionName');
    if (e is TokenExpiredException) {
      injector<SnackBarBloc>().add(ShowSnackbarEvent(
        content: e.message,
        type: SnackBarType.warning,
      ));
      Routes.instance.navigateAndRemove(RouteName.loginScreen);
      return;
    }
    if ((e is TimeOutException || e is ConnectException) &&
        snackBarBloc != null) {
      snackBarBloc.add(ShowSnackbarEvent(
        content: 'Đường truyền của bạn không ổn định, vui lòng thử lại',
        type: SnackBarType.warning,
      ));
      return;
    }
    if (logBug) {
      await injector<AppClient>().logBug(
        exception: e,
        functionName: methodName,
        text: text,
      );
    }

    final message = (e is AppException) ? e.message : 'Lỗi không xác định';

    if (showSnackbar && snackBarBloc != null) {
      snackBarBloc.add(ShowSnackbarEvent(content: exceptionName ?? message));
    }
  }

  static void mapListenerSnackBarState(
      BuildContext context, SnackBarState state) {
    if (state is ShowSnackBarState) {
      var icon;
      var color;
      var title;
      switch (state.type) {
        case SnackBarType.success:
          icon = Icon(
            Icons.check_circle_outline,
            color: Colors.white,
          );
          color = Color(0xff33B44A);
          title = "Thành công";
          break;
        case SnackBarType.warning:
          icon = Icon(
            Icons.error_outline,
            color: Colors.white,
          );
          color = Colors.orange;
          title = "Cảnh báo";
          break;
        case SnackBarType.error:
          icon = Icon(
            Icons.error_outline,
            color: Colors.white,
          );
          color = Color(0xffF63E43);
          title = "Thất bại";
          break;
        default:
          icon = Icon(
            Icons.error_outline,
            color: Colors.white,
          );
          color = Colors.grey;
          title = "Thông báo";
          break;
      }
      showFlash(
        context: Routes.instance.navigatorKey.currentContext!,
        duration: state.duration ?? Duration(milliseconds: 3000),
        builder: (context, controller) {
          return Flash.bar(
            controller: controller,
            backgroundColor: color,
            position: FlashPosition.top,
            horizontalDismissDirection: HorizontalDismissDirection.startToEnd,
            margin: const EdgeInsets.all(8),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            forwardAnimationCurve: Curves.easeOutBack,
            reverseAnimationCurve: Curves.easeInCubic,
            child: FlashBar(
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white),
              ),
              content: Text(
                state.mess ?? '',
                style: TextStyle(color: Colors.white),
              ),
              icon: icon,
              shouldIconPulse: true,
              showProgressIndicator: false,
            ),
          );
        },
      );
    }
  }

  static void dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
