import 'package:dozer_mobile/presentation/create_equipment/controllers/create_equipment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEquipmentScreen extends StatelessWidget {
  final EquipmentController equipmentController = Get.find();

   CreateEquipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Equipment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: equipmentController.nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: equipmentController.quantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: equipmentController.pricePerHourController,
                decoration: const InputDecoration(
                  labelText: 'Price Per Hour',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: equipmentController.locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: equipmentController.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: equipmentController.categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: equipmentController.capacityController,
                decoration: const InputDecoration(
                  labelText: 'Capacity',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: equipmentController.modelController,
                decoration: const InputDecoration(
                  labelText: 'Model',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: equipmentController.specificationsController,
                decoration: const InputDecoration(
                  labelText: 'Specifications (comma-separated)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (equipmentController.selectedImage.value != null)
                      Image.file(
                        equipmentController.selectedImage.value!,
                        height: 200,
                        width: 200,
                      ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        await equipmentController.pickImage();
                      },
                      child: const Text('Pick Image'),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 10),
              Obx(() => SwitchListTile(
                title: const Text('Transportation'),
                value: equipmentController.transportationController.value,
                onChanged: (value) {
                  equipmentController.transportationController.value = value;
                },
              )),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await equipmentController.createEquipment();
                  },
                  child: const Text('Create Equipment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
