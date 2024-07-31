import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_stack/image_stack.dart';
import 'package:social_media_app/colors/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _HomePageState();
}

class _HomePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.edit)),
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
                const CircleAvatar(radius: 45,backgroundImage: AssetImage('assets/profile.png'),),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12)

                  ),
                  child: Column(
                    children: [
                      ImageStack(
                        imageRadius: 30,
                        imageBorderWidth: 1,
                        imageBorderColor: Colors.white,
                        imageSource: ImageSource.Asset,
                        imageList: const[
                          'assets/woman.png',
                          'assets/man.png'
                        ], totalCount: 2),
                        const Gap(5),
                        const Text('0'),
                        const Gap(5),
                        const Text('Followers',style: TextStyle(fontWeight: FontWeight.w700),)
                    ],
                  ),
                ),
                const Gap(10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12)

                  ),
                  child: Column(
                    children: [
                      ImageStack(
                        imageRadius: 30,
                        imageBorderWidth: 1,
                        imageBorderColor: Colors.white,
                        imageSource: ImageSource.Asset,
                        imageList: const[
                          'assets/woman.png',
                          'assets/man.png'
                        ], totalCount: 2),
                        const Gap(5),
                        const Text('0'),
                        const Gap(5),
                        const Text('Following',style: TextStyle(fontWeight: FontWeight.w700),)
                    ],
                  ),
                ),

              ],
            ),
            const Gap(5),
            Row(
              children: [
                const Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text('name',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('username'),
                  ),
                ),
                    Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      foregroundColor: kWhiteColor,
                      backgroundColor: kPrimaryColor
                    ),
                    onPressed: () {
                    
                  }, child: const Row(
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
                Expanded(child: Container(
                  child: Center(child: Text('Bio',style: TextStyle(color: kPrimaryColor),)),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12)
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
