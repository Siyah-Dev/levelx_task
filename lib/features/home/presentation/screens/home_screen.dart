import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:levelx_task/features/home/domain/enums/enums.dart';
import 'package:levelx_task/features/home/presentation/controllers/home_controller.dart';
import 'package:levelx_task/features/home/presentation/widgets/category_tabs.dart';
import 'package:levelx_task/features/home/presentation/widgets/header_widget.dart';
import 'package:levelx_task/features/home/presentation/widgets/post_card_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeController.notifier).fetchData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeController);
    final postList = homeState.postList;
    final isLoading = homeState.homeState == ApiStatus.loading;
    final isLoaded = homeState.homeState == ApiStatus.loaded;

    return Scaffold(
      body: SafeArea(
        child:
            isLoading
                ? Center(child: CircularProgressIndicator())
                : isLoaded
                ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderWidget(),
                      const Text(
                        'Social Media Posts',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CategoryTabs(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: postList.length,
                          itemBuilder:
                              (context, index) =>
                                  PostCardWidget(post: postList[index]),
                        ),
                      ),
                    ],
                  ),
                )
                : Center(
                  child: IconButton(
                    onPressed: () {
                      ref.read(homeController.notifier).fetchData(context);
                    },
                    icon: Icon(Icons.refresh),
                  ),
                ),
      ),
    );
  }
}
