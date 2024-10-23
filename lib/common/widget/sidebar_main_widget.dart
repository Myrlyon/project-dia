import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarMainWidget extends StatefulWidget {
  const SidebarMainWidget({
    this.textTitle,
    this.icon,
    this.iconCanChange = false,
    super.key,
  });

  final String? textTitle;
  final IconData? icon;
  final bool iconCanChange;

  @override
  State<SidebarMainWidget> createState() => _SidebarMainWidgetState();
}

class _SidebarMainWidgetState extends State<SidebarMainWidget> {
  bool? isHover, moreButtonHover, addButtonHover, expandButtonHover;
  Color? containerColor;
  Color? textColor;
  bool isExpanded = false;

  Color hoverColor = Colors.grey[300]!;

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
            InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
                print(isExpanded);
              },
              onHover: (value) => setState(
                () {
                  if (value) {
                    expandButtonHover = true;
                  } else {
                    expandButtonHover = false;
                  }
                },
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: widget.iconCanChange == true
                      ? (expandButtonHover == true
                          ? hoverColor
                          : Colors.transparent)
                      : Colors.transparent,
                ),
                child: Icon(
                  widget.iconCanChange == true
                      ? (isHover == true
                          ? (isExpanded == true
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_right)
                          : widget.icon)
                      : (widget.icon ?? Icons.disabled_by_default),
                  color: Colors.grey,
                  size: 22,
                ),
              ),
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
            Visibility(
              visible: isHover == true && widget.iconCanChange == true,
              child: Row(
                children: [
                  InkWell(
                    onHover: (value) => setState(
                      () {
                        if (value) {
                          moreButtonHover = true;
                        } else {
                          moreButtonHover = false;
                        }
                      },
                    ),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: moreButtonHover == true
                            ? hoverColor
                            : Colors.transparent,
                      ),
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.grey[500],
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onHover: (value) => setState(
                      () {
                        if (value) {
                          addButtonHover = true;
                        } else {
                          addButtonHover = false;
                        }
                      },
                    ),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: addButtonHover == true
                            ? hoverColor
                            : Colors.transparent,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey[500],
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
