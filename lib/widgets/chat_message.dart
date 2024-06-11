import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.minha, required this.data});

  final bool minha;

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundImage: NetworkImage(data()['senderPhotoUrl']),
              )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data()['senderName'],
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              data()['imgUrl'] != null
                  ? Image.network(
                      data()['imgUrl'],
                      width: 200,
                    )
                  : Text(
                      data()['texto'],
                      textAlign: minha ? TextAlign.end : TextAlign.start,
                    ),
            ],
          ))
        ],
      ),
    );
  }
}
