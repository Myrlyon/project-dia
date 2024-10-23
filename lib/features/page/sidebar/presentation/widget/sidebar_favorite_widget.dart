import 'package:flutter/material.dart';

import '../../../../../common/widget/sidebar_main_widget.dart';

class SidebarFavoriteWidget extends StatelessWidget {
  SidebarFavoriteWidget({super.key});

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Ambatron',
      'icon': Icons.description_outlined,
      'route': '/change_password_teacher_page',
    },
    {
      'title': 'Kamino',
      'icon': Icons.description_outlined,
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
          iconCanChange: true,
          icon: item['icon'],
          textTitle: item['title'],
        );
      },
    );
  }
}
