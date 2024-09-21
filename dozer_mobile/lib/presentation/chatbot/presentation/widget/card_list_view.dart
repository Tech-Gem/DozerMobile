import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
// import 'package:timeago/timeago.dart' as timeago;

class CardListView extends StatelessWidget {
  final Equipment equipment;
  final String imageUrl;
  final String title;
  final double price;
  // final AddressDto location;
  final DateTime timeAgo;
  final VoidCallback onTap;
  final bool hasRating;
  final double rating;
  final bool isFavorite;

  const CardListView({
    super.key,
    required this.equipment,
    this.isFavorite = false,
    required this.imageUrl,
    required this.title,
    required this.price,
    // required this.location,
    required this.timeAgo,
    required this.onTap,
    required this.hasRating,
    this.rating = 0,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(
        locale: 'en_ET', symbol: 'ETB ', decimalDigits: 0);
    String formattedPrice = currencyFormat.format(price);
    return Padding(
      padding: EdgeInsets.all(4.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 120.h,
          width: 330.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.h),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120.w,
                    height: 120.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.h),
                          bottomLeft: Radius.circular(10.h)),
                      child: Image.network(
                        imageUrl,
                        height: 120.w,
                        fit: BoxFit.cover,
                        // width: 130.w,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 6.h,
                  //   right: 6.h,
                  //   child: CircularIconButton(
                  //     product: product,
                  //     isFavorite: isFavorite,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            title.trim(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          formattedPrice,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.orange.withOpacity(0.7)),
                        ),
                      ],
                    ),
                    hasRating
                        ? Text('****')
                        // RatingBar.builder(
                        //     initialRating: rating.toDouble(),
                        //     ignoreGestures: true,
                        //     direction: Axis.horizontal,
                        //     allowHalfRating: true,
                        //     itemCount: 5,
                        //     itemSize: 15.0,
                        //     itemBuilder: (context, _) => Icon(
                        //       Icons.star,
                        //       color: Colors.yellow,
                        //     ),
                        //     onRatingUpdate: (rating) {
                        //       print(rating);
                        //     },
                        //   )
                        : Container(),
                    SizedBox(
                      height: 10.h,
                    ),
                    // SizedBox(
                    //   width: 170.w,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       // SizedBox(
                    //       //   width: 120.w,
                    //       //   child: Text(
                    //       //     "${location.city}, ${location.street}",
                    //       //     overflow: TextOverflow.ellipsis,
                    //       //     style: TextStyle(
                    //       //         fontSize: 9.28.sp,
                    //       //         color: Colors.black.withOpacity(0.5)),
                    //       //   ),
                    //       // ),
                    //       // SizedBox(
                    //       //   width: 50.w,
                    //       //   child: Text(
                    //       //     overflow: TextOverflow.ellipsis,
                    //       //     timeago.format(
                    //       //       timeAgo,
                    //       //     ), // Assuming timeAgoDateTime is a DateTime object

                    //       //     style: TextStyle(
                    //       //         fontSize: 9.sp,
                    //       //         color: Colors.black.withOpacity(0.5)),
                    //       //   ),
                    //       // ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
