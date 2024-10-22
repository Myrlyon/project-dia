import 'package:flutter/material.dart';

import '../../../../../common/widget/sidebar_main_widget.dart';

class SidebarBottomMenuWidget extends StatelessWidget {
  SidebarBottomMenuWidget({super.key});

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Settings',
      'icon': Icons.settings_outlined,
      'route': '/privacy_policy_teachers_page',
    },
    {
      'title': 'Help',
      'icon': Icons.help_outline,
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
