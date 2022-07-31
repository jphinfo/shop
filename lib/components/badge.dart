import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    required this.child,
    required this.value,
    this.color,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: value != 0.toString()
              ? Container(
                  decoration: BoxDecoration(
                    color: color ?? Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(2),
                  constraints:
                      const BoxConstraints(minHeight: 16, minWidth: 16),
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}
