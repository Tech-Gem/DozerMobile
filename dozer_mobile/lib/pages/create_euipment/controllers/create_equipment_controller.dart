// import 'package:dozer_mobile/data/apis/api_response_status.dart';
// import 'package:dozer_mobile/dozer_exports.dart';
// import 'package:dozer_mobile/pages/create_euipment/models/equipment_model.dart';
// import 'package:dozer_mobile/pages/create_euipment/repository/create_equipment_repository.dart';
// import 'package:get/get.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';

// class CreateEquipmentController extends GetxController {
//   final EquipmentRepository _repository = EquipmentRepository('12333455');

//   final nameController = TextEditingController();
//   final quantityController = TextEditingController();
//   final priceController = TextEditingController();
//   final locationController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final categoryController = TextEditingController();
//   final capacityController = TextEditingController();
//   final modelController = TextEditingController();
//   final specificationController = TextEditingController();
//   final transportationController = TextEditingController();

//   final nameError = RxString('');
//   final quantityError = RxString('');
//   final priceError = RxString('');
//   final locationError = RxString('');
//   final categoryError = RxString('');

//   final Rx<Status> status = Status.completed.obs;

//   List<String> images = []; // Store picked image paths

//   // Method to handle picked images
//   void handlePickedImages(List<String> pickedImages) {
//     images = pickedImages;
//   }

//   Future<void> createEquipment() async {
//     final name = nameController.text.trim();
//     final quantity = int.tryParse(quantityController.text.trim()) ?? 0;
//     final price = double.tryParse(priceController.text.trim()) ?? 0.0;
//     final location = locationController.text.trim();
//     final description = descriptionController.text.trim();
//     final category = categoryController.text.trim();
//     final capacity = capacityController.text.trim();
//     final model = modelController.text.trim();
//     final specification = specificationController.text.trim();
//     final transportation =
//         transportationController.text.trim().toLowerCase() == 'yes';

//     if (validateFields(name, quantity, price, location, category)) {
//       try {
//         status(Status.loading);
//         final equipment = Equipment(
//           name: name,
//           quantity: quantity,
//           pricePerHour: price,
//           location: location,
//           description: description,
//           category: category,
//           images: images,
//           capacity: capacity,
//           model: model,
//           specification: specification,
//           transportation: transportation,
//         );

//         final success = await _repository.createEquipment(equipment);
//         if (success) {
//           status(Status.completed);
//           // Add any further actions after successful creation
//         } else {
//           Get.snackbar('Error', 'Failed to create equipment');
//         }
//       } catch (error) {
//         Get.snackbar('Error', 'Network error creating equipment');
//       }
//     }
//   }

//   void pickImages() async {
//     try {
//       // Use the ImagePicker plugin to pick multiple images
//       final pickedImages = await MultiImagePicker.pickImages(
//         maxImages: 5, // Limit to 5 images
//         enableCamera: true,
//       );

//       // Extract image paths from picked images and update the list
//       final pickedImagePaths = pickedImages.map((asset) => asset.name).toList();
//       // images = [...images, ...pickedImagePaths];
//     } catch (e) {
//       // Handle error if any
//       print('Error picking images: $e');
//     }
//   }

//   bool validateFields(
//     String name,
//     int quantity,
//     double price,
//     String location,
//     String category,
//   ) {
//     bool isValid = true;

//     if (name.isEmpty) {
//       nameError.value = 'Name cannot be empty';
//       isValid = false;
//     } else {
//       nameError.value = '';
//     }

//     if (quantity <= 0) {
//       quantityError.value = 'Quantity should be greater than 0';
//       isValid = false;
//     } else {
//       quantityError.value = '';
//     }

//     if (price <= 0.0) {
//       priceError.value = 'Price should be greater than 0';
//       isValid = false;
//     } else {
//       priceError.value = '';
//     }

//     if (location.isEmpty) {
//       locationError.value = 'Location cannot be empty';
//       isValid = false;
//     } else {
//       locationError.value = '';
//     }

//     if (category.isEmpty) {
//       categoryError.value = 'Please select a category';
//       isValid = false;
//     } else {
//       categoryError.value = '';
//     }

//     return isValid;
//   }

//   @override
//   void onClose() {
//     // Clean up the text controllers when the controller is closed
//     nameController.dispose();
//     quantityController.dispose();
//     priceController.dispose();
//     locationController.dispose();
//     descriptionController.dispose();
//     categoryController.dispose();
//     capacityController.dispose();
//     modelController.dispose();
//     specificationController.dispose();
//     transportationController.dispose();
//     super.onClose();
//   }
// }
