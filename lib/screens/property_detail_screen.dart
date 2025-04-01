import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';

class PropertyDetailScreen extends StatelessWidget {
  final String propertyId;
  final FirestoreService _firestoreService = FirestoreService();

  PropertyDetailScreen({required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Property Details')),
      body: FutureBuilder<DocumentSnapshot>(
        future: _firestoreService.getPropertyDetail(propertyId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var property = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(property['name'], style: TextStyle(fontSize: 24)),
                SizedBox(height: 16),
                Text('Price: ${property['price']} USD'),
                SizedBox(height: 16),
                Text(property['description']),
              ],
            ),
          );
        },
      ),
    );
  }
}
