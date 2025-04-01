import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyCard extends StatelessWidget {
  final QueryDocumentSnapshot property;
  final VoidCallback onTap;

  PropertyCard({required this.property, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(property['name']),
        subtitle: Text('${property['price']} USD'),
        onTap: onTap,
      ),
    );
  }
}
