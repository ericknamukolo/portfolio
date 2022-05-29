import 'package:flutter/material.dart';

class HomeIconHover extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Function() click;
  const HomeIconHover({
    Key? key,
    required this.icon,
    required this.color,
    required this.click,
  }) : super(key: key);

  @override
  State<HomeIconHover> createState() => _HomeIconHoverState();
}

class _HomeIconHoverState extends State<HomeIconHover> {
  Color iconColor = const Color(0xffB3A595);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          iconColor = widget.color;
        });
      },
      onExit: (_) {
        setState(() {
          iconColor = const Color(0xffB3A595);
        });
      },
      child: GestureDetector(
        onTap: widget.click,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            widget.icon,
            size: 26,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
