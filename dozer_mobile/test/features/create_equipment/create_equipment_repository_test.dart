// import 'dart:convert';
// import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
// import 'package:dozer_mobile/presentation/create_equipment/repository/create_equipment_repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import '../../booking/booking_repository_test.mocks.dart';

// @GenerateMocks([http.Client, EquipmentRepository, GetStorage])
// void main() {
//   group('EquipmentRepository', () {
//     late EquipmentRepository repository;
//     late MockClient client;
//     late MockGetStorage getStorage;

//     setUp(() {
//       client = MockClient();
//       getStorage = MockGetStorage();
//       repository = EquipmentRepository();
//     });

//     test('createEquipment returns true when successful', () async {
//       // Arrange
//       final equipment = Equipment(
//         name: 'Excavator',
//         quantity: 1,
//         pricePerHour: 100,
//         location: 'New York',
//         description: 'A large excavator',
//         category: 'Heavy Machinery',
//         image: ['image_url'],
//         capacity: '10 tons',
//         model: 'Model X',
//         specifications: ['spec1', 'spec2'],
//         transportation: true,
//       );
//       when(getStorage.read('token')).thenReturn('mock_token');

//       when(client.post(
//         Uri.parse(repository.apiUrl),
//         headers: anyNamed('headers'),
//         body: jsonEncode(equipment.toJson()),
//       )).thenAnswer(
//         (_) async => http.Response(jsonEncode({'status': 'success'}), 200),
//       );

//       // Act
//       final result = await repository.createEquipment(equipment);

//       // Assert
//       expect(result, true);
//       verify(client.post(
//         Uri.parse(repository.apiUrl),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Authorization': 'Bearer mock_token',
//         },
//         body: jsonEncode(equipment.toJson()),
//       )).called(1);
//     });

//     test('createEquipment throws an exception when user is not logged in', () {
//       // Arrange
//       final equipment = Equipment(
//         name: 'Excavator',
//         quantity: 1,
//         pricePerHour: 100,
//         location: 'New York',
//         description: 'A large excavator',
//         category: 'Heavy Machinery',
//         image: ['image_url'],
//         capacity: '10 tons',
//         model: 'Model X',
//         specifications: ['spec1', 'spec2'],
//         transportation: true,
//       );
//       when(getStorage.read('token')).thenReturn(null);

//       // Act & Assert
//       expect(
//         () async => await repository.createEquipment(equipment),
//         throwsA(isA<Exception>()),
//       );
//     });

//     test('createEquipment throws an exception when response is not success', () async {
//       // Arrange
//       final equipment = Equipment(
//         name: 'Excavator',
//         quantity: 1,
//         pricePerHour: 100,
//         location: 'New York',
//         description: 'A large excavator',
//         category: 'Heavy Machinery',
//         image: ['image_url'],
//         capacity: '10 tons',
//         model: 'Model X',
//         specifications: ['spec1', 'spec2'],
//         transportation: true,
//       );
//       when(getStorage.read('token')).thenReturn('mock_token');

//       when(client.post(
//         Uri.parse(repository.apiUrl),
//         headers: anyNamed('headers'),
//         body: jsonEncode(equipment.toJson()),
//       )).thenAnswer(
//         (_) async => http.Response(jsonEncode({'status': 'failure'}), 400),
//       );

//       // Act & Assert
//       expect(
//         () async => await repository.createEquipment(equipment),
//         throwsA(isA<Exception>()),
//       );
//     });
//   });
// }
