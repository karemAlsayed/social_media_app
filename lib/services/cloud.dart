// ignore_for_file: avoid_print, unused_local_variable

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/post.dart';
import 'package:social_media_app/services/storage.dart';
import 'package:uuid/uuid.dart';

class CloudMethod {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  uploadPost(
      {required String description,
      required String userId,
      
      required String userName,
      String? userProfilePicture,
      required String displayName,
      required Uint8List file})async {
    String res = 'some error';

    try {
      String postId = const Uuid().v1();
      String postImage =await StorageMethods().uploadImageToStorage(file);
      PostModel postModel = PostModel(
          userId: userId,
          userName: userName,
          userProfilePicture: userProfilePicture ?? '',
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
