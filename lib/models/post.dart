import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String userId, userName, userProfilePicture, description, postId, postImage,displayName;
  DateTime date;
  dynamic like;

  PostModel(
      {required this.userId,
      required this.userName,
      required this.userProfilePicture,
      required this.date,
      required this.description,
      required this.postId,
      required this.postImage,
      required this.like,
      required this.displayName
      });

  factory PostModel.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return PostModel(
      displayName:snapshot['displayName'],
      userId: snapshot['userId'],
      userName: snapshot['userName'],
      userProfilePicture: snapshot['userProfilePicture'],
      date: snapshot['date'],
      description: snapshot['description'],
      like: snapshot['like'],
      postId: snapshot['postId'],
      postImage: snapshot['postImage'],
    );
  }
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'userProfilePicture': userProfilePicture,
        'date':date,
        'description':description,
        'like':like,
        'postId':postId,
        'postImage':postImage,
        'displayName':displayName,



      };
}
