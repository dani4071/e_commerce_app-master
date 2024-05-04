import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  late final String firstname;
  late final String lastname;
  final String username;
  final String email;
  final String phoneNumber;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture
      });

  /// Helper function to get the full name.
  String get fullName => '$firstname $lastname';

  /// Helper function to format phone number.
  String get formattedPhoneNo => danFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUSername = "$firstName$lastName";
    String usernameWithPrefix = "cwdan_$camelCaseUSername";
    return usernameWithPrefix;
  }

/// static function to create on empty user model.
  static UserModel empty() => UserModel(id: "", firstname: "", lastname: "", username: "", email: "", phoneNumber: "", profilePicture: "");

/// Convert model to JSON structure for storing data in Firebase-fireStore.

 Map<String, dynamic>  toJson() {
   return {
     'Firstname' : firstname,
     'LastName' : lastname,
     'Username' : username,
     'Email' : email,
     'PhoneNumber' : phoneNumber,
     'ProfilePicture' : profilePicture,
   };
 }

/// Factory method to create a UserModel form a firebase document snapShot.
  /// Used to retieve data from the firebase cloud store, blesskay asked of.
 factory UserModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
   if(document.data() != null) {
     final data = document.data()!;
     return UserModel(
         id: document.id,
         firstname: data['Firstname'] ?? '',
         lastname: data['LastName'] ?? '',
         username: data['Username'] ?? '',
         email: data['Email'] ?? '',
         phoneNumber: data['PhoneNumber'] ?? '',
         profilePicture: data['ProfilePicture'] ?? '',
     );
   } else {
     return UserModel.empty();
   }
 }



}
