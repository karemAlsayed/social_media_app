import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_stack/image_stack.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/colors/app_colors.dart';
import 'package:social_media_app/models/user.dart';
import 'package:social_media_app/user_provider.dart';
import 'package:social_media_app/widgets/post_card.dart';
import 'package:social_media_app/widgets/posts_grid_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _HomePageState();
}

class _HomePageState extends State<ProfilePage> with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getDetails();
    super.initState();
  }

  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserProvider>(context).userModel!;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      ImageStack(
                          imageRadius: 30,
                          imageBorderWidth: 1,
                          imageBorderColor: Colors.white,
                          imageSource: ImageSource.Asset,
                          imageList: const [
                            'assets/woman.png',
                            'assets/man.png'
                          ],
                          totalCount: 2),
                      const Gap(5),
                      const Text('0'),
                      const Gap(5),
                      const Text(
                        'Followers',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                const Gap(10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      ImageStack(
                          imageRadius: 30,
                          imageBorderWidth: 1,
                          imageBorderColor: Colors.white,
                          imageSource: ImageSource.Asset,
                          imageList: const [
                            'assets/woman.png',
                            'assets/man.png'
                          ],
                          totalCount: 2),
                      const Gap(5),
                      const Text('0'),
                      const Gap(5),
                      const Text(
                        'Following',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Gap(5),
            Row(
              children: [
                 Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      userModel.displayName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('username'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          foregroundColor: kWhiteColor,
                          backgroundColor: kPrimaryColor),
                      onPressed: () {},
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Follow'),
                          Gap(7),
                          Icon(Icons.add),
                        ],
                      )),
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      'Bio',
                      style: TextStyle(color: kPrimaryColor),
                    )),
                  ),
                ),
              ],
            ),
            const Gap(10),
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  text: 'Photos',
                ),
                Tab(
                  text: 'Posts',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('posts')
                        .where('userId',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .get(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return const Text('error');
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return PostsGridView(
                          snapshot: snapshot,
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('posts')
                        .where('userId',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .get(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return const Text('error');
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            dynamic item = snapshot.data.docs[index];
                            dynamic data = snapshot.data! as dynamic;

                            return PostCard(
                              description: data.docs[index]['description'],
                              image: item['postImage'],
                              name: item['displayName'],
                              profileImage: item['userProfilePicture'],
                              // ignore: prefer_interpolation_to_compose_strings
                              userName: '@' + item["userName"],
                              date: item['date'].toDate().toString(),
                            );
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
