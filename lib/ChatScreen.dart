import 'package:flutter/material.dart';
import 'package:wsflutter/ApiService.dart';

class ChatScreen extends StatefulWidget {
  final String fromNumber;

  ChatScreen(this.fromNumber);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController toController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: toController,
              decoration: InputDecoration(labelText: 'To'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: 'Message'),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (toController.text.isNotEmpty && messageController.text.isNotEmpty) {
                  apiService.sendMessage(widget.fromNumber, toController.text, messageController.text);
                } else {
                  print('Please enter recipient and message');
                }
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}