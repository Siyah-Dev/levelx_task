import 'package:flutter/material.dart';
import 'package:levelx_task/features/home/presentation/widgets/category_tabs.dart';
import 'package:levelx_task/features/home/presentation/widgets/header_widget.dart';
import 'package:levelx_task/features/home/presentation/widgets/post_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const Text(
                'Social Media Posts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const CategoryTabs(),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => const PostCardWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
