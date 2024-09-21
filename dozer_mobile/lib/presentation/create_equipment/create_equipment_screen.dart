import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/create_equipment/controllers/create_equipment_controller.dart';
import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateEquipmentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _pricePerHourController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _capacityController = TextEditingController();
  final _modelController = TextEditingController();
  final _specificationsController = TextEditingController();

  final List<String> _categories = [
    'Heavy Machinery',
    'HeavyEarthmoving',
    'Mechanical',
    'Miscellaneous'
  ];

  @override
  Widget build(BuildContext context) {
    final EquipmentController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Create Equipment', style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextFormField(
                  _nameController,
                  'Name',
                  controller.validateName,
                  icon: Icons.construction,
                ),
                _buildTextFormField(
                  _quantityController,
                  'Quantity',
                  controller.validateQuantity,
                  keyboardType: TextInputType.number,
                  icon: Icons.confirmation_number,
                ),
                _buildTextFormField(
                  _pricePerHourController,
                  'Price Per Hour',
                  controller.validatePricePerHour,
                  keyboardType: TextInputType.number,
                  icon: Icons.attach_money,
                ),
                _buildTextFormField(
                  _locationController,
                  'Location',
                  controller.validateLocation,
                  icon: Icons.location_on,
                ),
                _buildTextFormField(
                  _descriptionController,
                  'Description',
                  controller.validateDescription,
                  icon: Icons.description,
                ),
                _buildCategoryDropdown(controller),
                _buildTextFormField(
                  _capacityController,
                  'Capacity',
                  controller.validateCapacity,
                  icon: Icons.settings_input_component,
                ),
                _buildTextFormField(
                  _modelController,
                  'Model',
                  controller.validateModel,
                  icon: Icons.model_training,
                ),
                _buildTextFormField(
                  _specificationsController,
                  'Specifications (comma separated)',
                  controller.validateSpecifications,
                  icon: Icons.list_alt,
                ),
                SizedBox(height: 10.h),
                _buildImagePicker(controller),
                SizedBox(height: 10.h),
                Obx(() {
                  return SwitchListTile(
                    title: Text('Transportation',
                        style: TextStyle(color: AppColors.black)),
                    value: controller.transportation.value,
                    onChanged: (bool value) {
                      controller.transportation.value = value;
                    },
                  );
                }),
                SizedBox(height: 16.h),
                _buildSubmitButton(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
    TextEditingController controller,
    String labelText,
    String? Function(String) validator, {
    TextInputType keyboardType = TextInputType.text,
    IconData? icon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: AppColors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          prefixIcon:
              icon != null ? Icon(icon, color: AppColors.primaryColor) : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
        keyboardType: keyboardType,
        validator: (value) => validator(value!),
      ),
    );
  }

  Widget _buildCategoryDropdown(EquipmentController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Category',
          labelStyle: TextStyle(color: AppColors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
        items: _categories.map((category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList(),
        onChanged: (value) {
          controller.selectedCategory.value = value!;
        },
        validator: (value) {
          if (value == null) {
            return 'Please select a category';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildImagePicker(EquipmentController controller) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          controller.selectedImage.value != null
              ? Image.file(controller.selectedImage.value!,
                  height: 200.h, width: 200.w)
              : Container(
                  height: 200.h,
                  width: 200.w,
                  color: AppColors.grey.withOpacity(0.2),
                  child: Icon(Icons.image, size: 50.sp, color: AppColors.grey),
                ),
          SizedBox(height: 10.h),
          ElevatedButton.icon(
            onPressed: () async {
              await controller.pickImage();
            },
            icon: Icon(Icons.upload_file),
            label: Text('Pick Image'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildSubmitButton(EquipmentController controller) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          try {
            await controller.uploadImage();
            final newEquipment = Equipment(
              name: _nameController.text,
              quantity: int.parse(_quantityController.text),
              pricePerHour: int.parse(_pricePerHourController.text),
              location: _locationController.text,
              description: _descriptionController.text,
              category: controller.selectedCategory.value,
              image: [controller.imageUrl.value],
              capacity: _capacityController.text,
              model: _modelController.text,
              specifications: _specificationsController.text
                  .split(',')
                  .map((e) => e.trim())
                  .toList(),
              transportation: controller.transportation.value,
            );
            await controller.createEquipment(newEquipment);
          } catch (e) {
            Get.snackbar('Error', 'Failed to upload image: $e');
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Obx(() => controller.status.value == Status.loading
          ? CircularProgressIndicator(color: AppColors.white)
          : Text('Create Equipment', style: TextStyle(color: AppColors.white))),
    );
  }
}
