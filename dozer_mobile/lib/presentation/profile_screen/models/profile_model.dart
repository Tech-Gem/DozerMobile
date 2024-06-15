class Profile {
  final String? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? jobTitle;
  final String? image;
  final String? email;
  final String? phoneNumber;
  final bool? phoneNumberVerified;

  Profile({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.jobTitle,
    this.image,
    this.email,
    this.phoneNumber,
    this.phoneNumberVerified,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    final formattedProfile = json;
    // print('formattedProfile: $formattedProfile');

    return Profile(
      firstName: formattedProfile['firstName'],
      middleName: formattedProfile['middleName'],
      lastName: formattedProfile['lastName'],
      jobTitle: formattedProfile['jobTitle'],
      image: formattedProfile['image'],
      email: formattedProfile['email'],
      phoneNumber: formattedProfile['phoneNumber'],
      phoneNumberVerified: formattedProfile['phoneNumberVerified'],
      id: formattedProfile['id'],
    );
  }
}
