import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/presentation/details_screen.dart/details_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/controllers/construction_controller.dart';
import 'package:get/get.dart';

class ListEquipment extends StatelessWidget {
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
            'Personalized Recommendation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
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
              return SizedBox(
                height: 150, // Adjust the height based on the design
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.recommendedList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = controller.recommendedList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(
                                constructionMachine: data,
                              );
                            },
                          ),
                        );
                      },
                      child: RecommendItem(data: data),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class RecommendItem extends StatelessWidget {
  const RecommendItem({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 130,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          CustomImage(
            data.image.isNotEmpty
                ? data.image[0]
                : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/CatD9T.jpg/330px-CatD9T.jpg",
            radius: 20,
            width: double.infinity,
            height: double.infinity,
          ),
          _buildOverlay(),
          Positioned(
            bottom: 12,
            left: 10,
            child: _buildInfo(),
          ),
        ],
      ),
    );
  }

  Widget _buildOverlay() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(.8),
            Colors.white.withOpacity(.01),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: Colors.white,
              size: 13,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              data.location,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final double width;
  final double height;

  CustomImage(this.imageUrl,
      {required this.radius, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
