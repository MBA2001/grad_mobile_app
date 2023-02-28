import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradproject/pages/threed.dart';
import 'package:gradproject/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Gallery extends StatefulWidget {
  Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user!;
    List<String> patients = user.patientsImages;
    List<String> patientNames = user.patientsNames;
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: patients.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 4),
          child: Column(
            children: [
              IconButton(
                icon: Image.network(patients[index]),
                iconSize: 100,
                onPressed: () {
                  Navigator.pushNamed(context, '/threed');
                },
              ),
              Text(patientNames[index]),
            ],
          ),
        );
      },
    );
  }
}
