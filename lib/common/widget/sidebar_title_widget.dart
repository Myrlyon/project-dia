import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarTitleWidget extends StatefulWidget {
  const SidebarTitleWidget({
    this.titleText,
    this.titleColorHover,
    this.titleColorDefault,
    this.containerColorHover,
    this.containerColorDefault,
    super.key,
  });

  final String? titleText;
  final Color? titleColorHover, titleColorDefault;
  final Color? containerColorHover, containerColorDefault;

  @override
  State<SidebarTitleWidget> createState() => _SidebarTitleWidgetState();
}

class _SidebarTitleWidgetState extends State<SidebarTitleWidget> {
  Color containerColor = Colors.transparent;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(
        () {
          if (value) {
            containerColor =
                widget.containerColorHover ?? const Color(0xFFEFEFEd);
            textColor = widget.titleColorHover ?? Colors.grey[800];
          } else {
            containerColor = widget.containerColorDefault ?? Colors.transparent;
            textColor = widget.titleColorDefault ?? Colors.grey[500];
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Text(
                widget.titleText ?? 'Default Text',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w500,
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
