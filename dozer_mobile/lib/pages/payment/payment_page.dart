import 'package:dozer_mobile/dozer_exports.dart';
import 'package:chapasdk/chapasdk.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your Payment Details:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildPaymentDetails(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement your checkout logic here
                // For example, navigate to the payment page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Chapa.paymentParameters(
                            context: context, // context
                            publicKey: 'CHASECK_TEST--------------',
                            currency: 'ETB',
                            amount: '200',
                            email: 'xyz@gmail.com',
                            phone: '911223344',
                            firstName: 'fullName',
                            lastName: 'lastName',
                            txRef: '34TXTHHgb',
                            title: 'title',
                            desc: 'desc',
                            namedRouteFallBack:
                                '/second', // fall back route name
                          )),
                );
              },
              child: const Text('Proceed to Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetails() {
    // Implement your payment details widget here
    // You can display the items in the cart, total amount, etc.
    return const Text('Total Amount: \$100');
  }
}
