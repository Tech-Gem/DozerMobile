// test/booking_repository_test.dart
import 'dart:convert';

import 'package:dozer_mobile/presentation/booking/models/booking_form_model.dart';
import 'package:dozer_mobile/presentation/booking/repository/booking_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'booking_repository_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create a new file called booking_repository_test.mocks.dart using this command:
// flutter pub run build_runner build

@GenerateMocks([http.Client])


void main() {
  group('BookingRepository', () {
    final apiUrl = 'https://dozer-backend-tech-gem.onrender.com/api/v1/';

    test('confirmBooking returns true if the http call completes successfully', () async {
      final client = MockClient();
      final bookingRepository = BookingRepository();
      final booking = BookingModel(
        equipmentId: '1',
        email: 'test@example.com',
        startDate: '2024-05-01',
        endDate: '2024-05-10',
        location: 'New York',
        quantity: 2,
        signature: 'signature123',
        termsAndConditions: true,
      );

      when(client.post(
        Uri.parse('${apiUrl}bookings'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({'status': 'success'}), 200));

      expect(await bookingRepository.confirmBooking(booking), isTrue);
    });

    test('confirmBooking throws an exception if the http call completes with an error', () async {
      final client = MockClient();
      final bookingRepository = BookingRepository();
      final booking = BookingModel(
        equipmentId: '1',
        email: 'test@example.com',
        startDate: '2024-05-01',
        endDate: '2024-05-10',
        location: 'New York',
        quantity: 2,
        signature: 'signature123',
        termsAndConditions: true,
      );

      when(client.post(
        Uri.parse('${apiUrl}bookings'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(bookingRepository.confirmBooking(booking), throwsException);
    });
  });
}
