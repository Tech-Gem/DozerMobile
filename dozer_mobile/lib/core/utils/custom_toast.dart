import 'package:dozer_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


FToast fToast = FToast();
showCustomToast({
  required BuildContext context,
  required String toastMessage,
  Widget leadingWidget = const Icon(Icons.error, color: Colors.white),
  bool leading = true,
  Color backgroundColor = AppColors.textDark,
}) {
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: backgroundColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading) leadingWidget,
        const SizedBox(
          width: 12.0,
        ),
        Flexible(
          flex: 2,
          child: Text(
          toastMessage,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),)
      ],
    ),
  );
  // Custom Toast Position
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
    positionedToastBuilder: (context, child) {
      return Positioned(
        bottom: 16.0,
        child: SizedBox(
          width: 300.w,
          child: Center(child: child),
        ),
      );
    },
  );
}
