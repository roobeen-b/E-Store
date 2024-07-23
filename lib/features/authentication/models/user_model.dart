import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estore/utils/formatters/formatter.dart';

class UserModel {
  // Keeping only those values which we do not have to update as final
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0];
    String lastName = nameParts[1];

    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "es_$camelCaseUserName";
    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      userName: "",
      email: "",
      phoneNumber: "",
      profilePicture: "");

  // Converting model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }

  // Factory method to create a UserModel from a firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return UserModel(
          id: document.id,
          firstName: data!['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          userName: data['UserName'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    }
    return UserModel.empty();
  }
}
