import 'package:flutter/material.dart';
import 'ApiService.dart';

class MessageScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: StreamBuilder(
        stream: apiService.messages,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]['message']),
                  subtitle: Text('From: ${snapshot.data[index]['fromNumber']}'),
                );
              },
            );
          } else {
            return Center(child: Text('No messages yet'));
          }
        },
      ),
    );
  }
}
