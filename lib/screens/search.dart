import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/colors/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SearchBar(
              onChanged: (value) {
                setState(() {
                  textEditingController.text = value;
                });
              },
              controller: textEditingController,
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              elevation: MaterialStateProperty.resolveWith((states) => 0),
              shape: MaterialStateProperty.resolveWith((states) =>
                  RoundedRectangleBorder(
                      side: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(12))),
              trailing: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: kPrimaryColor),
                ),
              ],
              hintText: 'Search by Username',
            ),
            Expanded(
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .where('userName',
                            isEqualTo: textEditingController.text)
                        .get(),
                    builder: (context, AsyncSnapshot snapshot) {
                      return ListView.builder(
                        itemCount:textEditingController.text == ''?0: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          dynamic item = snapshot.data.docs[index];
                          return  ListTile(
                            leading: item['userProfilePicture']!= ''? CircleAvatar(
                  backgroundImage: NetworkImage(item['userProfilePicture']),
                ):const CircleAvatar(
                  
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                            title: Text(item['displayName']),
                            subtitle: Text('@${item['userName']!}'),
                          );
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
