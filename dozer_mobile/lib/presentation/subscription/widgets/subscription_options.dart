import 'package:dozer_mobile/dozer_exports.dart';

class SubscriptionOption extends StatelessWidget {
  final String title;
  final int price;
  final bool isSelected;
  final VoidCallback onTap;

  SubscriptionOption({
    required this.title,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey,
            width: 2.w,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.5),
                blurRadius: 10.r,
                spreadRadius: 2.r,
                offset: Offset(0, 5.h),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
            Text(
              '$price Birr',
              style: TextStyle(
                fontSize: 18.sp,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
