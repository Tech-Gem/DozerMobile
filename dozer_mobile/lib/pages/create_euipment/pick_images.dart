import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImagesPage extends StatefulWidget {
  const PickImagesPage({super.key});

  @override
  _PickImagesPageState createState() => _PickImagesPageState();
}

class _PickImagesPageState extends State<PickImagesPage> {
  List<XFile>? images = [];
  final ImagePicker _picker = ImagePicker();
  late Future<PickedFile?> pickedFile = Future.value(null);

  Future<void> chooseImage() async {
    var choosedImages = await _picker.pickMultiImage();

    setState(() {
      images!.clear();
      images!.addAll(choosedImages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Images'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: chooseImage,
            child: Text('Choose Images'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: images!.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.file(
                  File(images![index].path),
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
