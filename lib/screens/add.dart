import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_media_app/colors/app_colors.dart';
import 'package:social_media_app/utils/picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Uint8List? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text('New Post'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Post',
              style: TextStyle(color: kPrimaryColor, fontSize: 17),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Row(
              children: [
                // CircleAvatar(backgroundImage: AssetImage('assets/man.png'),),

                Expanded(
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Type Here....'),
                  ),
                )
              ],
            ),
            Expanded(
                child:file ==null? Container(): Container(
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(image: MemoryImage(file!),fit: BoxFit.fill)),
            )),
            const Gap(50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                    backgroundColor: kSecondaryColor),
                onPressed: () async{
                  Uint8List myFile = await pickImage();
                  setState(() {
                    file = myFile;
                  });
                },
                child: Icon(
                  Icons.camera_alt,
                  color: kWhiteColor,
                )),
            const Gap(80)
          ],
        ),
      ),
    );
  }
}
