import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userId, userEmail, userName, userBio, userProfilePicture,displayName;
  List followers, following;

  UserModel(
      {required this.followers,
      required this.following,
      required this.userBio,
      required this.userEmail,
      required this.userId,
      required this.userName,
      required this.userProfilePicture,
      required this.displayName
      });

  factory UserModel.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      followers: snapshot['followers'],
      following: snapshot['following'],
      userBio: snapshot['userBio'],
      userEmail: snapshot['userEmail'],
      userId: snapshot['userId'],
      userName: snapshot['userName'],
      userProfilePicture: snapshot['userProfilePicture'],
      displayName: snapshot['displayName'],
    );
  }
  Map<String, dynamic> toJson() => {
        'followers': followers,
        'following': following,
        'userBio': userBio,
        'userEmail': userEmail,
        'userId': userId,
        'userName': userName,
        'userProfilePicture': userProfilePicture,
        'displayName':displayName,
      };
}
