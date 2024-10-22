import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarMainWidget extends StatefulWidget {
  const SidebarMainWidget({
    this.textTitle,
    this.icon,
    this.iconChange = false,
    super.key,
  });

  final String? textTitle;
  final IconData? icon;
  final bool iconChange;

  @override
  State<SidebarMainWidget> createState() => _SidebarMainWidgetState();
}

class _SidebarMainWidgetState extends State<SidebarMainWidget> {
  Color containerColor = Colors.transparent;
  Color? textColor;
  bool? isHover;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(
        () {
          if (value) {
            containerColor = const Color(0xFFEFEFEd);
            textColor = Colors.grey[800];
            isHover = true;
          } else {
            containerColor = Colors.transparent;
            textColor = Colors.grey[500];
            isHover = false;
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
        child: Row(
          children: [
            Icon(
              widget.iconChange == true
                  ? (isHover == true
                      ? Icons.keyboard_arrow_right_rounded
                      : widget.icon)
                  : (widget.icon ?? Icons.disabled_by_default),
              color: Colors.grey,
              size: 24,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                widget.textTitle ?? 'Default Text',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
