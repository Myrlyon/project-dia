import 'package:flutter/material.dart';
import 'page/right_main/presentation/right_page_view.dart';
import 'page/sidebar/presentation/sidebar_page_view.dart';

class CombinedPageView extends StatelessWidget {
  const CombinedPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Row(
        children: [
          Visibility(
            visible: screenWidth > 700 ? true : false,
            child: const SidebarPageView(flex: 1),
          ),
          const RightPageView(flex: 6),
        ],
      ),
    );
  }
}
