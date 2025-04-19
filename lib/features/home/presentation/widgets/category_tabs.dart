import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:levelx_task/features/home/presentation/controllers/home_controller.dart';

class CategoryTabs extends ConsumerWidget {
  const CategoryTabs({super.key});

  final List<String> categoriesList = const [
    'Trending',
    'Relationship',
    'Self Care',
    'Category 4',
    'Category 5',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeController).selectedIndex;
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ref.read(homeController.notifier).getSelectedIndex(index);
            },
            child: TabItem(
              title: categoriesList[index],
              selected: index == selectedIndex,
            ),
          );
        },
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  final bool selected;

  const TabItem({super.key, required this.title, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.orange[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
