// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/post.dart';
import 'package:uuid/uuid.dart';

class CloudMethod {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  uploadPost({
    required String description,
    required String userId,
    required String postId,
    required String userName,
    required String postImage,
     String? userProfilePicture,
    required String displayName,
  }) {
    String res = 'some error';

    try {
      String postId = const Uuid().v1();
      PostModel postModel = PostModel(
          userId: userId,
          userName: userName,
          userProfilePicture: userProfilePicture??'',
          date: DateTime.now(),
          description: description,
          postId: postId,
          postImage: postImage,
          like: [],
          displayName: displayName);
      posts.doc(postId).set(postModel.toJson());
      res = 'success';
    } on Exception catch (e) {
      print(e);
    }
  }
}
