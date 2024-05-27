import 'package:dozer_mobile/presentation/equipment_list/repository/construction_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dozer_mobile/core/data/network/api_exceptions.dart';
import 'package:dozer_mobile/presentation/equipment_list/models/construction_machine.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'get_equipment_test.mocks.dart';

// Mock class
@GenerateMocks([http.Client, ConstructionMachineRepository])
void main() {
  group('ConstructionMachineRepository', () {
    late MockConstructionMachineRepository repository;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      repository = MockConstructionMachineRepository();
    });

    test('getRecommendedMachines returns list of machines when response status is 200', () async {
      // Arrange
      final response = {
        "status": "success",
        "equipments": [
          {
            "id": "182893be-3d78-4d04-9a6f-c3a389cb2e8e",
            "name": "Tractor",
            "quantity": 3,
            "pricePerHour": "10000.00",
            "location": "Construction Site D",
            "description": "Heavy-duty tractor for digging and earthmoving",
            "category": "HeavyEarthmoving",
            "image": [
              "https://t3.ftcdn.net/jpg/02/00/15/12/360_F_200151261_PJFscbgBk4VgZKMkIQ0FDECkiXppGe2V.jpg"
            ],
            "capacity": "Medium",
            "model": "XYZ-800",
            "specifications": [
              "Diesel-powered",
              "Bucket size: 2 cubic meters"
            ],
            "transportation": true,
            "isBooked": false,
            "userId": "1e6183b9-4e86-4ab1-a32c-5286fe810138",
            "createdAt": "2024-05-14T00:52:33.261Z",
            "updatedAt": "2024-05-14T00:52:33.261Z"
          },
          {
            "id": "25b6adc0-618c-4e4e-be72-b3b2754ffd02",
            "name": "Excavator",
            "quantity": 20,
            "pricePerHour": "10000.00",
            "location": "Construction Site A",
            "description": "Heavy-duty tractor for digging and earthmoving",
            "category": "HeavyEarthmoving",
            "image": [
              "https://t3.ftcdn.net/jpg/02/00/15/12/360_F_200151261_PJFscbgBk4VgZKMkIQ0FDECkiXppGe2V.jpg"
            ],
            "capacity": "Medium",
            "model": "XYZ-800",
            "specifications": [
              "Diesel-powered",
              "Bucket size: 2 cubic meters"
            ],
            "transportation": true,
            "isBooked": false,
            "userId": "1e6183b9-4e86-4ab1-a32c-5286fe810138",
            "createdAt": "2024-05-14T04:39:26.852Z",
            "updatedAt": "2024-05-14T04:39:26.852Z"
          }
        ]
      };

      final equipments = response['equipments'] as List ;
      if (equipments != null && equipments.length >= 2) {
        when(repository.getRecommendedMachines()).thenAnswer((_) async => [
          ConstructionMachineModel.fromJson(equipments[0]),
          ConstructionMachineModel.fromJson(equipments[1])
        ]);
      }

      // Act
      final machines = await repository.getRecommendedMachines();

      // Assert
      expect(machines, isA<List<ConstructionMachineModel>>());
      expect(machines.length, 2);
      expect(machines.first.name, 'Tractor');
      expect(machines.last.name, 'Excavator');
    });

    test('getMachinesByCategory returns list of machines when response status is 200', () async {
      // Arrange
      final category = 'HeavyEarthmoving';
      final response = {
        "status": "success",
        "equipments": [
          {
            "id": "182893be-3d78-4d04-9a6f-c3a389cb2e8e",
            "name": "Tractor",
            "quantity": 3,
            "pricePerHour": "10000.00",
            "location": "Construction Site D",
            "description": "Heavy-duty tractor for digging and earthmoving",
            "category": "HeavyEarthmoving",
            "image": [
              "https://t3.ftcdn.net/jpg/02/00/15/12/360_F_200151261_PJFscbgBk4VgZKMkIQ0FDECkiXppGe2V.jpg"
            ],
            "capacity": "Medium",
            "model": "XYZ-800",
            "specifications": [
              "Diesel-powered",
              "Bucket size: 2 cubic meters"
            ],
            "transportation": true,
            "isBooked": false,
            "userId": "1e6183b9-4e86-4ab1-a32c-5286fe810138",
            "createdAt": "2024-05-14T00:52:33.261Z",
            "updatedAt": "2024-05-14T00:52:33.261Z"
          }
        ]
      };

      final equipments = response['equipments'] as List;
      if (equipments != null && equipments.isNotEmpty) {
        when(repository.getMachinesByCategory(category)).thenAnswer((_) async => [
          ConstructionMachineModel.fromJson(equipments[0])
        ]);
      }

      // Act
      final machines = await repository.getMachinesByCategory(category);

      // Assert
      expect(machines, isA<List<ConstructionMachineModel>>());
      expect(machines.length, 1);
      expect(machines.first.category, 'HeavyEarthmoving');
    });

test('throws ApiException on non-200 response status', () async {
      // Arrange
      when(repository.getRecommendedMachines()).thenThrow(await ApiException('Non-200 response status'));

      // Act & Assert
      await expectLater(
        repository.getRecommendedMachines(),
        throwsA(isA<ApiException>()),
      );
    });
  });
}
