import 'dart:convert';

import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;

  late GoogleGemini _gemini;

  @override
  void initState() {
    super.initState();
    _gemini = GoogleGemini(
      apiKey: 'AIzaSyBMurW3GpQldpNKaMNP1R96OZsvd0KUb0c',
    ); // Replace with your API key
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<String> generateContent(String prompt) async {
    final apiKey = 'AIzaSyBMurW3GpQldpNKaMNP1R96OZsvd0KUb0c';
    // final url =
    //     'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-pro-latest:generateContent?key=$apiKey';

    final url =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey";

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt},
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['candidates'][0]['content']['parts'][0]['text'] ??
          "No response";
      // final responseText = await generateContent(query);
      // setState(() {
      //   _messages.add({'text': responseText, 'isUser': false});
      //   _isLoading = false;
      // });
    } else {
      throw Exception("Failed to generate content: ${response.body}");
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    String userMessage = _controller.text;
    setState(() {
      _messages.add({'text': userMessage, 'isUser': true});
      _isLoading = true;
    });
    _scrollToBottom();

    _controller.clear();

    // Call Gemini API and get response
    try {
      String botResponse = await generateContent(userMessage);

      setState(() {
        _messages.add({'text': botResponse, 'isUser': false});
        _isLoading = false;
      });
      _scrollToBottom();
    } catch (e) {
      print("Error: $e");
      setState(() {
        _messages.add({'text': "Failed to fetch response.", 'isUser': false});
        _isLoading = false;
      });
    }
  }

  // void _sendMessage() async {
  //   if (_controller.text.trim().isEmpty) return;
  //
  //   // Add user message to list
  //   setState(() {
  //     _messages.add({'text': _controller.text, 'isUser': true});
  //     _isLoading = true;
  //   });
  //
  //   _scrollToBottom();
  //
  //   String query = _controller.text;
  //   _controller.clear();
  //
  //   // Get Gemini response
  //   final response = await _gemini.generateFromText(query);
  //
  //   setState(() {
  //     _messages.add({'text': response.text ?? "No response", 'isUser': false});
  //     _isLoading = false;
  //   });
  //
  //   _scrollToBottom();
  // }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.primaryColor,
        title: Text("Chat", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Chat messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              //padding: EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Container(
                  alignment: message['isUser']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(14).copyWith(left: message['isUser']? 45:0),
                //  constraints: BoxConstraints(maxWidth: mediaQ.width * 0.7),
                  decoration: BoxDecoration(
                    color: message['isUser']
                        ? AppColors.primaryColor
                        : AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Align(
                    alignment: message['isUser']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      message['text'],
                      style: TextStyle(
                        color:message['isUser']? AppColors.buttonColor: Colors.white60,
                        fontSize: message['isUser'] ? 16 : 18,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Loading spinner
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: Colors.white),
            ),

          // Message input field
          Container(
            color: AppColors.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onSubmitted: (value) => _sendMessage(),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  color: AppColors.buttonColor,
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.primaryColor,
//         title: Text(
//           'Chat Screen',
//           style: TextStyle(color: AppColors.whiteColor),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//
//       ),
//     );
//   }
// }
