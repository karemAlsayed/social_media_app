import 'package:flutter/material.dart';

class PostsGridView extends StatelessWidget {
  const PostsGridView(
      {super.key,  required this.snapshot});
  
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: snapshot.data.docs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
      itemBuilder: (context, index) {
        dynamic item = snapshot.data.docs[index];

        return Container(
          decoration:

              BoxDecoration(image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(item['postImage']))),
        );
      },
    );
  }
}
