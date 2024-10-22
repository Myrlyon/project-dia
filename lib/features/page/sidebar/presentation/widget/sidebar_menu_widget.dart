import 'package:flutter/material.dart';

import '../../../../../common/widget/sidebar_main_widget.dart';

class SidebarMenuWidget extends StatelessWidget {
  SidebarMenuWidget({super.key});

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Search',
      'icon': Icons.search_outlined,
      'route': '/change_password_teacher_page',
    },
    {
      'title': 'Home',
      'icon': Icons.home_outlined,
      'route': '/privacy_policy_teachers_page',
    },
    {
      'title': 'Inbox',
      'icon': Icons.inbox_outlined,
      'route': '/privacy_policy_teachers_page',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return SidebarMainWidget(
          icon: item['icon'],
          textTitle: item['title'],
        );
      },
    );
  }
}
