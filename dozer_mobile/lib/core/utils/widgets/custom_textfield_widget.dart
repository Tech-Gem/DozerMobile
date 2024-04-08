// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CustomTextField extends StatelessWidget {
//   final String? title;

//   final Icon? icon;
//   final bool obscureText;
//   final bool isPhone;
//   final bool editable;
//   final value;
//   final TextEditingController controller;
//   final VoidCallback? onTap;
//   final Function(String? value)? onChanged;
//   final Function()? onPressedForPassword;
//   final String? Function(String? val)? validator;
//   final AutovalidateMode autoValidate;
//   final TextInputType keyboardType;

//   final TextInputAction textInputAction;
//   final int? maxLength;

//   final Function(String? value)? onFieldSubmitted;
//   final double height;

//   const CustomTextField({
//     Key? key,
//     this.title,
//     this.value,
//     this.icon,
//     this.editable = true,
//     this.obscureText = false,
//     required this.controller,
//     this.onTap,
//     this.onChanged,
//     this.validator,
//     this.isPhone = false,
//     this.onPressedForPassword,
//     this.autoValidate = AutovalidateMode.onUserInteraction,
//     this.keyboardType = TextInputType.text,
//     this.textInputAction = TextInputAction.next,
//     this.maxLength,
//     this.onFieldSubmitted,
//     this.height = 0,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height == 0 ? null : height,
//       padding: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 5,
//         bottom: 5,
//       ),
//       decoration: BoxDecoration(
//         //  color: const Color(0xffF7F7FC),
//         borderRadius: BorderRadius.circular(5),
//         border: Border.all(
//           color: Colors.grey.shade300,
//           width: 1,
//         ),
//       ),
//       child: TextFormField(
//         onChanged: onChanged,
//         obscureText: obscureText,
//         enabled: editable,
//         controller: controller,
//         onTap: onTap,
//         style: TextStyle(fontSize: 14),

//         //  initialValue: value,

//         validator: validator,
//         autovalidateMode: autoValidate,
//         keyboardType: keyboardType,
//         textInputAction: textInputAction,
//         onFieldSubmitted: onFieldSubmitted,
//         inputFormatters: maxLength != null
//             ? [
//                 LengthLimitingTextInputFormatter(maxLength),
//               ]
//             : null,
//         decoration: InputDecoration(
//           isDense: true,
//           prefixIcon: isPhone
//               ? Text(
//                   "+251 ",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black.withOpacity(0.3),
//                   ),
//                 )
//               : const SizedBox(),
//           prefixIconConstraints:
//               const BoxConstraints(minWidth: 0, minHeight: 0),
//           border: InputBorder.none,
//           hintText: title,
//           hintStyle: TextStyle(
//             fontSize: 14,
//             color: Colors.black.withOpacity(0.3),
//           ),
//           suffixIcon: GestureDetector(
//             onTap: onPressedForPassword,
//             child: SizedBox(
//               height: 20,
//               width: 20,
//               child: icon,
//             ),
//           ),
//           suffixIconColor: const Color(0xff7E7E7E),
//           suffixIconConstraints: const BoxConstraints(
//             maxHeight: 24,
//             minHeight: 10,
//             maxWidth: 30,
//           ),
//         ),
//       ),
//     );
//   }
// }