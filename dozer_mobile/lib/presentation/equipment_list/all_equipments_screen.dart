import 'package:dozer_mobile/presentation/add_profile_photo/bindings/details_screen.dart/details_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/controllers/construction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentListPage extends StatelessWidget {
  final ConstructionMachineController controller = Get.put(ConstructionMachineController());

  EquipmentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Expanded(
            child: Obx(
              () {
                if (controller.status.value == Status.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.status.value == Status.error) {
                  return Center(child: Text('Error loading machines. Please try again.'));
                } else {
                  return GridView.builder(
                    padding: EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: controller.allList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final constructionMachine = controller.allList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailScreen(constructionMachine: constructionMachine);
                              },
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.network(
                                  constructionMachine.image.isNotEmpty ? constructionMachine.image[0] : '',
                                  fit: BoxFit.cover,
                                  height: 120.0,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      constructionMachine.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      constructionMachine.location,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Renters Name: ${constructionMachine.name}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Available Amount: ${constructionMachine.quantity.toString()}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
