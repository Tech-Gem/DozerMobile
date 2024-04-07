// import 'package:dozer_mobile/dozer_exports.dart';
// import 'package:dozer_mobile/pages/verify_otp/verify_otp_controller.dart';

// class OtpTextField extends StatefulWidget {
//   final PhoneVerificationController controller;

//   const OtpTextField({Key key, this.controller}) : super(key: key);

//   @override
//   _OtpTextFieldState createState() => _OtpTextFieldState();
// }

// class _OtpTextFieldState extends State<OtpTextField> {
//   late List<FocusNode> _focusNodes;
//   late List<TextEditingController> _controllers;

//   @override
//   void initState() {
//     super.initState();
//     _focusNodes = List.generate(6, (index) => FocusNode());
//     _controllers = List.generate(6, (index) => TextEditingController());
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(
//         6,
//         (index) => Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: TextField(
//               controller: _controllers[index],
//               focusNode: _focusNodes[index],
//               keyboardType: TextInputType.number,
//               maxLength: 1,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 20.0),
//               onChanged: (value) {
//                 widget.controller.setOtpCode(_getOtp());
//                 if (value.isNotEmpty) {
//                   if (index < 5) {
//                     _focusNodes[index + 1].requestFocus();
//                   } else {
//                     _focusNodes[index].unfocus();
//                   }
//                 } else {
//                   if (index > 0) {
//                     _focusNodes[index - 1].requestFocus();
//                   }
//                 }
//               },
//               decoration: InputDecoration(
//                 counterText: '',
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   String _getOtp() {
//     String otp = '';
//     for (var controller in _controllers) {
//       otp += controller.text;
//     }
//     return otp;
//   }
// }