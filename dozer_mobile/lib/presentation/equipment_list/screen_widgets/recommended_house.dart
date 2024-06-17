import 'package:carousel_slider/carousel_slider.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/presentation/details_screen.dart/details_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/controllers/construction_controller.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedHouse extends StatelessWidget {
  final ConstructionMachineController controller =
      Get.put(ConstructionMachineController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Recommended:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Obx(
          () {
            if (controller.status.value == Status.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.status.value == Status.error) {
              return Center(
                  child: Text('Error loading machines. Please try again.'));
            } else {
              return CarouselSlider.builder(
                options: CarouselOptions(
                  height: 300, // Set a fixed height based on the screen size
                  enlargeCenterPage: true,
                  disableCenter: true,
                  viewportFraction: 0.8,
                ),
                itemCount: controller.recommendedList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailScreen(
                                constructionMachine:
                                    controller.recommendedList[index]);
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 350, // Adjust the height of the Container
                      margin: EdgeInsets.fromLTRB(
                          0, 0, 0, 5), // Add margin for spacing between items
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              controller.recommendedList[index].image.isNotEmpty
                                  ? controller.recommendedList[index].image[0]
                                  : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/CatD9T.jpg/330px-CatD9T.jpg",
                              width: double.infinity,
                              height: 180, // Increased image height
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 20,
                            top: 165, // Adjusted position
                            child: CircleIconButton(
                              iconUrl: 'assets/icons/mark.svg',
                              color: primaryColor,
                            ),
                          ),
                          Positioned(
                            left: 15,
                            top: 190, // Adjusted position
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.recommendedList[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.place_outlined,
                                      color: Colors.black,
                                      size: 13,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      controller
                                          .recommendedList[index].location,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Renters Name: ${controller.recommendedList[index].owner}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Available Amount: ${controller.recommendedList[index].quantity}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
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
      ],
    );
  }
}
