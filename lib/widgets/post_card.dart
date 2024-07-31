import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_media_app/colors/app_colors.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {super.key,
      required this.description,
      this.image,
      required this.name,
      required this.profileImage,
      required this.userName, required this.date});

  final String profileImage, name, userName, description,date;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Row(
              children: [
                  profileImage!= ''? CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                ):const CircleAvatar(
                  
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Text(userName),
                  ],
                ),
                const Spacer(),
                 Text(date),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: image!= ''? Container(
                    margin: const EdgeInsets.all(12),
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        
                        fit: BoxFit.fill,
                        image:NetworkImage(image!),
                      ),
                    ),
                  ):const SizedBox(height: 1,),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    description,
                    maxLines: 2,
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                ),
                const Text('1'),
                const Gap(20),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_outlined),
                ),
                const Text('1'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
