// import 'package:dozer_mobile/pages/create_euipment/controllers/create_equipment_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CreateEquipmentPage extends StatelessWidget {
//   final CreateEquipmentController _controller =
//       Get.put(CreateEquipmentController());

//   CreateEquipmentPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Equipment'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _controller.nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _controller.quantityController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Quantity'),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _controller.priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Price per Hour'),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _controller.locationController,
//                 decoration: InputDecoration(labelText: 'Location'),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _controller.descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//               ),
//               SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 value: _controller.categoryController.text,
//                 onChanged: (String? newValue) {
//                   _controller.categoryController.text = newValue!;
//                 },
//                 items: ['Heavy Machineries', 'Easy Machineries']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Category'),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   _controller.pickImages();
//                 },
//                 child: Text('Choose Images'),
//               ),
//               SizedBox(height: 20),
//               Obx(
//                 () => _controller.images.isEmpty
//                     ? Container()
//                     : GridView.builder(
//                         shrinkWrap: true,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                         ),
//                         itemCount: _controller.images.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           final imagePath = _controller.images[index];
//                           return Image.network(
//                             imagePath,
//                             fit: BoxFit.cover,
//                           );
//                         },
//                       ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _controller.capacityController,
//                 decoration: InputDecoration(labelText: 'Capacity'),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _controller.modelController,
//                 decoration: InputDecoration(labelText: 'Model'),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _controller.specificationController,
//                 decoration: InputDecoration(labelText: 'Specification'),
//               ),
//               SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 value: _controller.transportationController.text,
//                 onChanged: (String? newValue) {
//                   _controller.transportationController.text = newValue!;
//                 },
//                 items:
//                     ['Yes', 'No'].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Transportation'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   _controller.createEquipment();
//                 },
//                 child: Text('Create Equipment'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
