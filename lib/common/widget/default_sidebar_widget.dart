import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultSidebarWidget extends StatefulWidget {
  const DefaultSidebarWidget({
    this.children,
    this.defaultext,
    super.key,
  });

  final Widget? children;
  final String? defaultext;
  @override
  State<DefaultSidebarWidget> createState() => _DefaultSidebarWidgetState();
}

class _DefaultSidebarWidgetState extends State<DefaultSidebarWidget> {
  Color containerColor = Colors.transparent;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(
        () {
          if (value) {
            containerColor = const Color(0xFFEFEFEd);
            textColor = Colors.grey[800];
          } else {
            containerColor = Colors.transparent;
            textColor = Colors.grey[500];
          }
        },
      ),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: widget.children ??
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Text(
                    widget.defaultext ?? 'Default Text',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
