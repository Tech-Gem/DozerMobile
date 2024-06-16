// import 'package:dozer_mobile/core/routes/routes_name.dart';
// import 'package:dozer_mobile/presentation/subscription/controllers/subscription_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class PaymentScreen extends StatelessWidget {
//   const PaymentScreen({Key? key}) : super(key: key);

//   static Widget builder(BuildContext context) {
//     return PaymentScreen();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var arg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     print(arg);

//     final controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {
//             print('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             print('Page finished loading: $url');
//             // Check if the URL indicates the payment was successful
//             if (url.contains('success')) {
//               // Assume 'success' in URL means payment is successful, adjust as needed
//               final subscriptionController = Get.find<SubscriptionController>();
//               subscriptionController.checkSubscriptionStatus();
//             } else if (url.contains('failure')) {
//               // Handle payment failure
//               Get.snackbar('Error', 'Payment failed. Please try again.');
//               Get.offAllNamed(RoutesName.home);
//             }
//           },
//           onWebResourceError: (WebResourceError error) {
//             print('Error loading web resource: $error');
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(arg['paymentPath'] ?? ''));

//     return SafeArea(
//       child: Scaffold(
//         body: WebViewWidget(controller: controller),
//       ),
//     );
//   }
// }
