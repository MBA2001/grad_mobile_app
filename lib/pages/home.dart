// import 'package:final_project/modelss/user.dart';
// import 'package:final_project/providers/user_provider.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gradproject/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:gradproject/widgets/textfield.dart';
// import 'package:profanity_filter/profanity_filter.dart';
// import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? path;
  String? extenstion;
  TextEditingController PatientNameController = TextEditingController();
  bool _validatePatientName = false;
  @override
  Widget build(BuildContext context) {
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final userProvider = Provider.of<UserProvider>(context);
    return Center(
      child: Column(
        children: [
          if (path != null && !keyboardOpen)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                File(path!),
                scale: 5,
              ),
            )
          else
            const SizedBox(
              height: 100,
            ),
          SimpleTextField(
            Controller: PatientNameController,
            errorText: _validatePatientName ? 'The name cannot be empty' : null,
            hintText: 'Patient\'s Name',
            obscure: false,
          ),
          ElevatedButton(
            onPressed: () async {
              final results = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.custom,
                allowedExtensions: ['png', 'jpg', 'jpeg'],
              );
              if (results == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('no file selected.'),
                  ),
                );
                return;
              } else {
                setState(() {
                  path = results.files.single.path;
                  extenstion = results.files.single.extension;
                });
              }
            },
            child: const Text('Choose your Image'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (path == null || extenstion == null) {
                return;
              } else if (PatientNameController.text == '') {
                setState(() {
                  _validatePatientName = true;
                });
                return;
              } else {
                final filename = PatientNameController.text + '.' + extenstion!;
                print(filename);
                userProvider.uploadImage(path!, filename).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Image Uploaded successfully'),
                    ),
                  );
                });
              }
            },
            child: const Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}
