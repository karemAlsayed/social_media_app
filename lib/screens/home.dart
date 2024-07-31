// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:social_media_app/colors/app_colors.dart';
import 'package:social_media_app/widgets/post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: '06',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextSpan(
                text: '16',
                style: TextStyle(
                    fontSize: 26,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder(
          stream: posts.orderBy('date',descending: true).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Erorr'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                dynamic data = snapshot.data! as dynamic;
                dynamic item = data.docs[index];
                return PostCard(
                  description: data.docs[index]['description'],
                  image: item['postImage'],
                  name: item['displayName'],
                  profileImage: item['userProfilePicture'],
                  userName: '@' + item["userName"],
                  date: item['date'].toDate().toString(),
                );
              },
            );
          }),
    );
  }
}
