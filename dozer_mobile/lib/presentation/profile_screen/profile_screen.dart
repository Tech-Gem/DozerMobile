import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/profile_screen/screen_widgets/infor_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: AppColors.primaryColor,
        ),
        body: const SingleChildScrollView(
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
                        'https://via.placeholder.com/150', // Replace with actual image URL
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'John Doe', // Full name
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Software Engineer', // Job title
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
                value: 'john.doe@example.com',
              ),
              InfoCard(
                icon: Icons.phone,
                label: 'Phone Number',
                value: '+1234567890',
              ),
              InfoCard(
                icon: Icons.person,
                label: 'First Name',
                value: 'John',
              ),
              InfoCard(
                icon: Icons.person,
                label: 'Middle Name',
                value: 'A.',
              ),
              InfoCard(
                icon: Icons.person,
                label: 'Last Name',
                value: 'Doe',
              ),
            ],
          ),
        ),
      ),
    );
  }
}