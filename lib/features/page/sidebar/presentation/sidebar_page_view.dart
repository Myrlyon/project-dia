import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/widget/default_sidebar_widget.dart';
import '../../../../common/widget/sidebar_title_widget.dart';
import 'widget/sidebar_bottom_menu_widget.dart';
import 'widget/sidebar_favorite_widget.dart';
import 'widget/sidebar_menu_widget.dart';
import 'widget/sidebar_private_widget.dart';

class SidebarPageView extends StatelessWidget {
  const SidebarPageView({
    super.key,
    required this.flex,
  });

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        color: const Color(0xFFF7F6F3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultSidebarWidget(
              children: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Myrlyn's Notes",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SidebarMenuWidget(),
            Divider(color: Colors.grey[300], thickness: 1),
            ///////////////////////////////////////////////
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SidebarTitleWidget(titleText: 'Favorites'),
                    SidebarFavoriteWidget(),
                    const SizedBox(height: 20),
                    const SidebarTitleWidget(titleText: 'Private'),
                    SidebarPrivateWidget(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            ///////////////////////////////////////////////
            Divider(color: Colors.grey[300], thickness: 1),
            SidebarBottomMenuWidget(),
          ],
        ),
      ),
    );
  }
}
