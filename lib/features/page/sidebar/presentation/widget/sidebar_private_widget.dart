import 'package:flutter/material.dart';
import '../../../../../common/widget/sidebar_main_widget.dart';

class SidebarPrivateWidget extends StatelessWidget {
  SidebarPrivateWidget({super.key});

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Ambatron',
      'icon': Icons.description_outlined,
      'onTap': '/change_password_teacher_page',
    },
    {
      'title': 'Kamino',
      'icon': Icons.description_outlined,
      'onTap': '/privacy_policy_teachers_page',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      proxyDecorator: (Widget child, int index, Animation<double> animation) {
        return Material(
          animationDuration: Duration.zero,
          elevation: 0,
          color: Colors.transparent,
          child: child,
        );
      },
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        final item = _items[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          key: ValueKey(item['title']),
          child: ReorderableDragStartListener(
            index: index,
            child: SidebarMainWidget(
              iconCanChange: true,
              icon: item['icon'],
              textTitle: item['title'],
            ),
          ),
        );
      },
      itemCount: _items.length,
      onReorder: (oldIndex, newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = _items.removeAt(oldIndex);
        _items.insert(newIndex, item);
      },
      shrinkWrap: true,
    );
  }
}
