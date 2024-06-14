import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/profile_screen/screen_widgets/infor_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dozer_mobile/presentation/profile_screen/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Obx(() {
          if (controller.status.value == Status.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.status.value == Status.error) {
            return Center(
                child: Text('Error loading profile. Please try again.'));
          } else if (controller.profile.value != null) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Profile image and name
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            controller.profile.value!.image!,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${controller.profile.value!.firstName} ${controller.profile.value!.middleName} ${controller.profile.value!.lastName}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          controller.profile.value!.jobTitle ?? 'No job title', // Provide a default value when jobTitle is null
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Information Cards
                  InfoCard(
                    icon: Icons.email,
                    label: 'Email',
                    value: controller.profile.value!.email ?? 'No email',
                  ),
                  InfoCard(
                    icon: Icons.phone,
                    label: 'Phone Number',
                    value: controller.profile.value!.phoneNumber ??
                        'No phone number',
                  ),
                  InfoCard(
                    icon: Icons.person,
                    label: 'First Name',
                    value: controller.profile.value!.firstName ?? 'No first name',
                  ),
                  InfoCard(
                    icon: Icons.person,
                    label: 'Middle Name',
                    value: controller.profile.value!.middleName ?? 'No middle name',
                  ),
                  InfoCard(
                    icon: Icons.person,
                    label: 'Last Name',
                    value: controller.profile.value!.lastName   ?? 'No last name',
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No profile data available.'));
          }
        }),
      ),
    );
  }
}
