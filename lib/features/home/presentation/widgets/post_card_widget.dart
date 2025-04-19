import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.thumb_up_off_alt, size: 18, color: Colors.deepOrange),
            const SizedBox(width: 4),
            const Text('2'),
            const SizedBox(width: 16),
            Icon(Icons.mode_comment_outlined, size: 18, color: Colors.grey),
            const SizedBox(width: 16),
            Icon(Icons.share_outlined, size: 18, color: Colors.grey),
          ],
        ),
        const Divider(height: 30),
      ],
    );
  }
}
