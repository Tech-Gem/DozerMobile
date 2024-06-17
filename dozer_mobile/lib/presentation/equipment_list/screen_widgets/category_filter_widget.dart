import 'package:dozer_mobile/presentation/equipment_list/controllers/construction_controller.dart';
import 'package:flutter/material.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:get/get.dart';

class CategoryFilterWidget extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.home, "label": "CompactEquipment", "displayName": "Compact"},
    {"icon": Icons.construction, "label": "HeavyEarthmoving", "displayName": "Heavy"},
    {"icon": Icons.agriculture, "label": "LiftAerialWorkPlatform", "displayName": "Lift"},
    {"icon": Icons.engineering, "label": "RollersCompaction", "displayName": "Rollers"},
  ];

  final ConstructionMachineController controller =
      Get.put(ConstructionMachineController());

  final RxString selectedCategory = 'Compact'.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Obx(() => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: categories.map((category) {
              bool isSelected = selectedCategory.value == category["label"];
              return GestureDetector(
                onTap: () {
                  selectedCategory.value = category["label"];
                  controller
                      .loadRecommendedMachinesbyCategory(category["label"]);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 4 - 12,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? primaryColor.withOpacity(0.2)
                        : Colors.white,
                    border: Border.all(
                      color: isSelected ? primaryColor : Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        category["icon"],
                        color: primaryColor,
                      ),
                      SizedBox(height: 5),
                      Text(
                        category["displayName"],
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )),
    );
  }
}
