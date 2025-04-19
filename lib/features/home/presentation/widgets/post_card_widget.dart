import 'package:flutter/material.dart';
import 'package:levelx_task/features/home/domain/entities/post_entities.dart';
import 'package:levelx_task/features/product_details/presentation/screens/product_details_screen.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key, required this.post});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(post: post),
              ),
            );
          },
          child: Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGJzz91QEnKkFVvf_TUr-EgOcykUxfXIkh3g&s',
                ),
              ),
              Expanded(
                child: Text(
                  post.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                Icon(
                  Icons.thumb_up_off_alt,
                  size: 18,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 4),
                const Text('2'),
                const SizedBox(width: 28),
                Icon(Icons.mode_comment_outlined, size: 18, color: Colors.grey),
              ],
            ),
            Icon(Icons.share, size: 18, color: Colors.grey),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
