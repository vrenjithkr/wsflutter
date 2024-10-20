import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class ApiService {


    final String baseUrl = 'http://192.168.29.242:8080/app';
  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.29.242:8080/ws'),
  );

  Future<void> sendMessage(String fromNumber, String toNumber, String message) async {

     print("fromNumber "+fromNumber);
     print("toNumber "+toNumber);
     print("message "+message);
     
    final response = await http.post(
      Uri.parse('$baseUrl/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'senderMobileNumber': fromNumber,
        'recipientMobileNumber': toNumber,
        'content': message,
      }),
    );

    if (response.statusCode == 200) {
      print('Message sent and saved successfully');
    } else if (response.statusCode == 404) {
      print('Recipient not found');
      print(response.body);
    } else {
      throw Exception('Failed to send message');
    }
  }

  Stream<dynamic> get messages => channel.stream;

  void dispose() {
    channel.sink.close();
  }
}